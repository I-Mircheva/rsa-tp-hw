
class MessagesController < ApplicationController

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    message = Message.find_by id: params[:message_id]

    respond_to do |format|
      format.json { render json: { 'message' => message.content } }
    end
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    key = RsaFull.find_by id: params[:id]
    encrypted_message = key.encrypt(params[:message])
    message = Message.new(content: encrypted_message)

    message.save! # Will throw an error if invalid ( unlikely event) !
    respond_to do |format|
      format.json { render json: { 'id' => message.id } }
    end
  end

  def decrypt
    key = RsaFull.find_by id: params[:id]
    message = Message.new(content: key.decrypt(params[:message]))

    message.save! # Will throw an error if invalid ( unlikely event) !
    respond_to do |format|
      format.json {render json: {'id' => message.id, 'message' => message.content}}
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def message_params
      params.require(:message).permit(:content)
    end
end
