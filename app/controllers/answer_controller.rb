class AnswerController < ApplicationController
  def index
    @quize = Quize.find(params[:quize_id])
  end
end
