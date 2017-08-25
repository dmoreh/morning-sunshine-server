class DocumentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  before_action :set_document, only: [:show]

  # GET /documents/1
  def show
    send_data(@document.file_contents,
              type: @document.content_type,
              filename: @document.filename)
  end

  # GET /upload
  def new
    @document = Document.new
  end

  # POST /upload
  def create
    @document = Document.new(document_params)

    if @document.save
      flash[:success] = "Thanks! I can't wait to wake up to your message."
      redirect_to root_path
    else
      render :new
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    def record_not_found(error)
      render json: { error: error.message }, status: :not_found
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:file)
    end

end
