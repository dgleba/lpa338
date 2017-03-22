class ResponsesController < ApplicationController
  # devise..
  before_filter :authenticate_user!
  # sorcery..
  #before_action :require_login
  # cancancan..
  load_and_authorize_resource :response

  # GET /responses
  def index
    @q = @responses.search params[:q]
    @responses = @q.result.page(params[:page])
  end

  # GET /responses/1
  def show
  end

  # GET /responses/new
  def new
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses
  def create
    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: t('success_create') }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { render :new }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responses/1
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: t('success_update') }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url, notice: t('success_destroy') }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def response_params
    params.require(:response).permit(:name, :survey_id, :user_id, :ip, answers_attributes: [:id, :name,  :sort, :_destroy], questions_attributes: [:id, :name, :_destroy], choices_attributes: [:id, :name, :_destroy])
  end
end
