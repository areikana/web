class MemoryController < ApplicationController
  def index
    @memory = Memory.new
  end

  def create
    @memory = Memory.new(memory_params)
    if @memory.save
      redirect_to preview_memory_index_path, notice: "記録しました"
    else
      render :index
    end
  end

  def preview
    @memories = Memory.all.order(created_at: :desc)
  end

  def show
    @memory = Memory.find(params[:id])
  end

  private

  def memory_params
    params.require(:memory).permit(:body, :exercise)
  end
end
