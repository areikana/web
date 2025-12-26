class MemoryController < ApplicationController
  def index
    @memory = Memory.new
  end

  # 一覧専用
  def preview
    @memories = Memory.all
  end

  def create
    @memory = Memory.new(memory_params)
    if @memory.save
      redirect_to preview_memory_index_path
    else
      render :index
    end
  end

  def show
    @memory = Memory.find(params[:id])
  end

  private

  def memory_params
    params.require(:memory).permit(:body)
  end
end

