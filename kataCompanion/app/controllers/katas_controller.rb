class KatasController < ApplicationController
  before_action :set_kata, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!

  # GET /katas
  # GET /katas.json
  def index
    @katas = current_user.katas.all
  end

  # GET /katas/1
  # GET /katas/1.json
  def show
  end

  # GET /katas/new
  def new
    @kata = current_user.katas.new
  end

  # GET /katas/1/edit
  def edit
  end

  # POST /katas
  # POST /katas.json
  def create
    @kata = current_user.katas.new(kata_params)

    respond_to do |format|
      if @kata.save
        format.html { redirect_to @kata, notice: 'Kata was successfully created.' }
        format.json { render :show, status: :created, location: @kata }
      else
        format.html { render :new }
        format.json { render json: @kata.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /katas/1
  # PATCH/PUT /katas/1.json
  def update
    respond_to do |format|
      if @kata.update(kata_params)
        format.html { redirect_to @kata, notice: 'Kata was successfully updated.' }
        format.json { render :show, status: :ok, location: @kata }
      else
        format.html { render :edit }
        format.json { render json: @kata.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /katas/1
  # DELETE /katas/1.json
  def destroy
    @kata.destroy
    respond_to do |format|
      format.html { redirect_to katas_url, notice: 'Kata was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kata
	  unless @kata = current_user.katas.where(id: params[:id]).first
        flash[:alert] = 'Bookmark not found.'
        redirect_to root_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kata_params
      params.require(:kata).permit(:title, :url, :movements, :movement_links)
    end
end
