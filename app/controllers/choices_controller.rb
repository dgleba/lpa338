class ChoicesController < ApplicationController
  # devise..
  before_filter :authenticate_user!
  # sorcery..
  #before_action :require_login
  # cancancan..
  load_and_authorize_resource :choice

  # GET /choices
  def index
    @q = @choices.search params[:q]
    @choices = @q.result.page(params[:page])
  end

  # GET /choices/1
  def show
  end

  # GET /choices/new
  def new
  end

  # GET /choices/1/edit
  def edit
  end

  # POST /choices
  def create
    respond_to do |format|
      if @choice.save
        format.html { redirect_to @choice, notice: t('success_create') }
        format.json { render :show, status: :created, location: @choice }
      else
        format.html { render :new }
        format.json { render json: @choice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /choices/1
  def update
    respond_to do |format|
      if @choice.update(choice_params)
        format.html { redirect_to @choice, notice: t('success_update') }
        format.json { render :show, status: :ok, location: @choice }
      else
        format.html { render :edit }
        format.json { render json: @choice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /choices/1
  def destroy
    @choice.destroy
    respond_to do |format|
      format.html { redirect_to choices_url, notice: t('success_destroy') }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def choice_params
    params.require(:choice).permit(:name, :question_id)
  end
end
