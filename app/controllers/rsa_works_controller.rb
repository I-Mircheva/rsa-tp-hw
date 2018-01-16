class RsaWorksController < ApplicationController
  before_action :set_rsa_work, only: [:show, :edit, :update, :destroy]

  # GET /rsa_works
  # GET /rsa_works.json
  def index
    @rsa_works = RsaWork.all
  end

  # GET /rsa_works/1
  # GET /rsa_works/1.json
  def show
  end

  # GET /rsa_works/new
  def new
    @rsa_work = RsaWork.new
  end

  # GET /rsa_works/1/edit
  def edit
  end

  # POST /rsa_works
  # POST /rsa_works.json
  def create
    @rsa_work = RsaWork.new(rsa_work_params)

    respond_to do |format|
      if @rsa_work.save
        format.html { redirect_to @rsa_work, notice: 'Rsa work was successfully created.' }
        format.json { render :show, status: :created, location: @rsa_work }
      else
        format.html { render :new }
        format.json { render json: @rsa_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rsa_works/1
  # PATCH/PUT /rsa_works/1.json
  def update
    respond_to do |format|
      if @rsa_work.update(rsa_work_params)
        format.html { redirect_to @rsa_work, notice: 'Rsa work was successfully updated.' }
        format.json { render :show, status: :ok, location: @rsa_work }
      else
        format.html { render :edit }
        format.json { render json: @rsa_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rsa_works/1
  # DELETE /rsa_works/1.json
  def destroy
    @rsa_work.destroy
    respond_to do |format|
      format.html { redirect_to rsa_works_url, notice: 'Rsa work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rsa_work
      @rsa_work = RsaWork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rsa_work_params
      params.fetch(:rsa_work, {})
    end
end
