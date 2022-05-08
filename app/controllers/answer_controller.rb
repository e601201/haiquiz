class AnswerController < ApplicationController
  def index
    @quize = Quize.find(params[:quize_id])
  end

  def create
    p params
    @quize = Quize.find(params[:quize_id])
    if @quize.answer_word == params[:answer_word]
      @quize
      flash.now[:success] = "大正解です"
      render :index 
    else
      @quize
      flash[:danger] = "不正解です"
      redirect_back(fallback_location: root_path)
    end
  end

end
