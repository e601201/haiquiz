class QuizesController < ApplicationController
  skip_before_action :check_logged_in, only: :index
  before_action :set_quize, only: %i[ show edit update destroy ]

  # GET /quizes or /quizes.json
  def index
    @quizes = Quize.all
  end

  # GET /quizes/1 or /quizes/1.json
  def show
  end

  # GET /quizes/new
  def new
    @quize = Quize.new
  end

  # GET /quizes/1/edit
  def edit
  end

  # POST /quizes or /quizes.json
  def create
    @quize = Quize.new(quize_params)
    @quize.title = "無題" if @quize.title.empty?
    @quize.content = "ノーヒント" if @quize.content.empty?

    p word = @quize.select_answer_word_line(@quize)
    empty_word = "○"*@quize.answer_word.length
    if word&.include?(@quize.answer_word) 
      word.gsub!(/#{@quize.answer_word}/,"[#{empty_word}]")
    else
      flash.now[:danger] = "穴埋めにする言葉が句の中に入ってません"
      render :new and return
    end
    respond_to do |format|
      if @quize.save
        format.html { redirect_to quize_url(@quize), notice: "クイズが作成されました" }
        format.json { render :show, status: :created, location: @quize }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quize.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizes/1 or /quizes/1.json
  def update
    respond_to do |format|
      if @quize.update(quize_params)
        format.html { redirect_to quize_url(@quize), notice: "クイズが作成されました" }
        format.json { render :show, status: :ok, location: @quize }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quize.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizes/1 or /quizes/1.json
  def destroy
    @quize.destroy

    respond_to do |format|
      format.html { redirect_to quizes_url, notice: "クイズが消去されました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quize
      @quize = Quize.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quize_params
      params.require(:quize).permit(:title, :content, :status, :first_line, :second_line, :third_line, :answer_word)
    end
end
