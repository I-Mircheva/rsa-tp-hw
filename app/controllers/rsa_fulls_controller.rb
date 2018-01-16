class RsaFullsController < ApplicationController
  before_action :set_rsa_full, only: [:show, :edit, :update, :destroy]

  # GET /rsa_fulls
  # GET /rsa_fulls.json
  def index
    @rsa_fulls = RsaFull.all
  end

  # GET /rsa_fulls/1
  # GET /rsa_fulls/1.json
  def show
    my_rsa = RsaFull.find_by id: params[:id]
    respond_to do |format|
         format.json {render json: {'n' => my_rsa.n, 'e' => my_rsa.e, 'd' => my_rsa.d}}
     end
  end

  # GET /rsa_fulls/new
  def new
    @rsa_full = RsaFull.new
  end

  # GET /rsa_fulls/1/edit
  def edit
  end

  # POST /rsa_fulls
  # POST /rsa_fulls.json
  def create

    keys = [:n, :e, :d]
    p keys
    if (params.keys & keys).any?
      my_rsa = RsaFull.new(n: params[:n], e: params[:e], d: params[:d])
    else
      keys = RsaFull.new_key
      my_rsa = RsaFull.new(n: keys[0], e: keys[1], d: keys[2])
    end
    p keys
    respond_to do |format|
       if my_rsa.save
         format.json {render json: {'id' => my_rsa.id}}###
       end
     end
  end

  # PATCH/PUT /rsa_fulls/1
  # PATCH/PUT /rsa_fulls/1.json
  def update
    respond_to do |format|
      if @rsa_full.update(rsa_full_params)
        format.html { redirect_to @rsa_full, notice: 'Rsa full was successfully updated.' }
        format.json { render :show, status: :ok, location: @rsa_full }
      else
        format.html { render :edit }
        format.json { render json: @rsa_full.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rsa_fulls/1
  # DELETE /rsa_fulls/1.json
  def destroy
    @rsa_full.destroy
    respond_to do |format|
      format.html { redirect_to rsa_fulls_url, notice: 'Rsa full was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rsa_full
      @rsa_full = RsaFull.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rsa_full_params
      params.require(:rsa_full).permit(:n, :e, :d)
    end
end
