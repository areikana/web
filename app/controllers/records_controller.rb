class RecordsController < ApplicationController
  def index
  # 1. まず日付順に並んだレコードを取得
    @records = Record.all.order(date: :desc)
  
  # 2. 日付ごとに集計する（ここをシンプルにします）
  # .sort は使わず、最初から並んでいる @records を使うのがコツです
    @daily_calories = @records.group_by(&:date).transform_values do |records|
        records.sum(&:total_calories)
    end
  end

  # 詳細画面: 特定のIDの記録を1件取得する
  def show
    @record = Record.find(params[:id])
  end

  # 新規作成画面: 新しいRecordオブジェクトを空で作る
  def new
    @record = Record.new
  end

  # 編集画面: 編集したい特定のIDの記録を取得する
  def edit
    @record = Record.find(params[:id])
  end

  # 保存処理: フォームから送られてきたデータを保存する
  def create
    @record = Record.new(record_params)
    @record.date = Date.today # ここで強制的に今日の日付をセット！

    if @record.save
      redirect_to records_path, notice: "食事を記録しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # 更新処理: 編集したデータを上書き保存する
  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to record_path(@record), notice: "記録を更新しました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # 削除処理: データを消す
  def destroy
  @record = Record.find(params[:id])
  @record.destroy
  
  # status: :see_other を付け加えるのがポイント！
  redirect_to records_path, notice: "記録を削除しました", status: :see_other
  end

  private

  # セキュリティのための設定（受け取る項目を限定する）
  def record_params
    params.require(:record).permit(:total_calories, :memo, :meal_type)
  end
end