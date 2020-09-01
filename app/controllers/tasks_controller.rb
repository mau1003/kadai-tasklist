class TasksController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(message_params)

    if @tasks.save
      flash[:success] = 'タスクが正常に投稿されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'タスクが投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    @tasks = Task.find(params[:id])

    if @tasks.update(message_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy

    flash[:success] = 'タスクは正常に削除されました'
    redirect_to tasks_url
  end

  private

  def set_message
    @tasks = Task.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end