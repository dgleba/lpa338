class SurveysController < ApplicationController
  # devise..
  before_filter :authenticate_user!
  # sorcery..
  #before_action :require_login
  # cancancan..
  load_and_authorize_resource :survey

  # GET /surveys
  def index
    @q = @surveys.search params[:q]
    @surveys = @q.result.page(params[:page])
  end

  # GET /surveys/1
  def show
  end

  # GET /surveys/new
  def new
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  def create
    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: t('success_create') }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: t('success_update') }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: t('success_destroy') }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def survey_params
    params.require(:survey).permit(:name, :user_id)
  end
end
