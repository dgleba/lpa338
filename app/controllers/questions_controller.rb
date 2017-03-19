class QuestionsController < ApplicationController
  # devise..
  before_filter :authenticate_user!
  # sorcery..
  #before_action :require_login
  # cancancan..
  load_and_authorize_resource :question

  # GET /questions
  def index
    @q = @questions.search params[:q]
    @questions = @q.result.page(params[:page])
  end

  # GET /questions/1
  def show
  end

  # GET /questions/new
  def new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: t('success_create') }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: t('success_update') }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: t('success_destroy') }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def question_params
    params.require(:question).permit(:name, :question_list_id, :sort, :qtype, :survey_id)
  end
end
