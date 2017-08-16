class DocumentsController < ApplicationController
  before_action :set_document, only: [:show]

  # GET /documents
  def index
    @documents = Document.all
  end

  # GET /documents/1
  def show
    send_data(@document.file_contents,
              type: @document.content_type,
              filename: @document.filename)
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # POST /documents
  def create
    @document = Document.new(document_params)

    if @document.save
      redirect_to root_path, notice: 'Document was successfully created.'
    else
      render :new
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:file)
    end

end
