
class HiddenNotesController < ApplicationController
before_action :set_hidden_note, only: [:show, :destroy]

  # GET /hidden_notes
  # GET /hidden_notes.json
  def index
    @hidden_notes = HiddenNote.all
  end

  # GET /hidden_notes/1
  # GET /hidden_notes/1.json
  def show
   @hidden_note.destroy
   respond_to do |format|
    format.html { render :show, notice: 'This Hidden note is now successfully destroyed.'}
    format.json { head :no_content }
  end
end
  # i made dis
  def show_url
  end

  # GET /hidden_notes/new
  def new
    @hidden_note = HiddenNote.new
  end

  # POST /hidden_notes
  # POST /hidden_notes.json
  def create
    messages_url = "https://do-not-keep-that.herokuapp.com/hidden_notes"
    if request.content_type =~ /xml/
    message_hash = Hash.from_xml(request.body.read)

         params[:hidden_note] = {"your_note" => message_hash["message"]}

         @hidden_note = HiddenNote.create(hidden_note_params)

         url = '<?xml version = "1.0" encoding = "UTF-8" standalone ="yes"?>' +
               "<url>" +
                 messages_url + '/' + @hidden_note.id.to_s +
               "</url>"

         render :xml => url
       else
         respond_to do |format|
             format.json {
               params[:hidden_note] = {"your_note" => params[:message]}

               @hidden_note = HiddenNote.create(hidden_note_params)

               url = {"url" => messages_url + "/" + @hidden_note.id.to_s}

               render :json => url.to_json
             }

             format.html {
               @hidden_note = HiddenNote.create(hidden_note_params)

               render :get
             }
         end

    end

  # if request.content_type =~ /xml/
  #   params[:your_note] = Hash.from_xml(request.body.read)["message"]
  #   notes_url = "https://do-not-keep-that.herokuapp.com/hidden_notes/#{hidden_note.id}"
  #   hidden_note = HiddenNote.new(your_note: params[:your_note])
  #   render xml:
  #   '<?xml version = "1.0" encoding = "UTF-8" standalone = "yes"?>' + '<url>' +  notes_url + hidden_note.id + "/info" + '</url>'
  # elsif request.content_type =~ /json/
  #  hidden_note = HiddenNote.new(your_note: params[:your_note])
  #   notes_url = "https://do-not-keep-that.herokuapp.com/hidden_notes/#{hidden_note.id}"
  #  render json: {url: notes_url + hidden_note.id + '/info'}
  # elsif request.content_type =~ /form/
  #   @hidden_note = HiddenNote.new(hidden_note_params)
  #   respond_to do |format|
  #    if @hidden_note.save
  #       format.html { render :show_url, notice: 'Hidden note was successfully created.'}
  #       format.json { render :show_url, status: :created, location: @hidden_note }
  #    else
  #       format.html { render :new }
  #       format.json { render json: @hidden_note.errors, status: :unprocessable_entity }
  #    end
  #   end
  # end
end

  # DELETE /hidden_notes/1
  # DELETE /hidden_notes/1.json
  def destroy
    @hidden_note.destroy
    respond_to do |format|
      format.html { redirect_to hidden_notes_url, notice: 'Hidden note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hidden_note
      @hidden_note = HiddenNote.find_by(id: params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hidden_note_params
      params.require(:hidden_note).permit(:your_note)
    end
    def hidden_note_api_params
      params.permit(:your_note)
    end
  end
