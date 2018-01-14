
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

# POST /hidden_notes
# POST /hidden_notes.json
def create
  messages_url = "https://do-not-keep-that.herokuapp.com/hidden_notes"

  respond_to do |format|
    format.xml {
      message_hash = Hash.from_xml(request.body.read)

      params[:hidden_note] = {"your_note" => message_hash["message"]}

      @hidden_note = HiddenNote.create(hidden_note_params)

      url = '<?xml version = "1.0" encoding = "UTF-8" standalone ="yes"?>' +
           "<url>" +
             "#{messages_url}/#{@hidden_note.id.to_s}" +
           "</url>"
           "<encrypted_message>" +
             "#{@hidden_note.encrypted_message(params[:key], params[:value])}" +
           "</encrypted_message>"

      render :xml => url
     }

    format.json {
      @hidden_note = HiddenNote.create(your_note: params[:message])

      # url = {"url" => messages_url + "/" + @hidden_note.id.to_s}

      url = hidden_note_path(@hidden_note.id, host_name: messages_url)

      render :json => url.to_json
    }

    format.html {
      @hidden_note = HiddenNote.create(hidden_note_params)

      render :show
    }
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
