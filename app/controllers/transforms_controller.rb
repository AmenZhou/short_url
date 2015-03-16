class TransformsController < ApplicationController
  before_action :set_transform, only: [:show, :go]

  # GET /transforms/1
  # GET /transforms/1.json
  def show
  end

  # GET /transforms/new
  def new
    @transform = Transform.new
  end

  # POST /transforms
  # POST /transforms.json
  def create
    @transform = Transform.new(transform_params)

    respond_to do |format|
      if @transform.save
        format.html { redirect_to @transform, notice: 'Transform was successfully created.' }
        format.json { render :show, status: :created, location: @transform }
      else
        format.html { render :new }
        format.json { render json: @transform.errors, status: :unprocessable_entity }
      end
    end
  end

  def go
    redirect_to @transform.long_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transform
      @transform = Transform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transform_params
      params.require(:transform).permit(:long_url)
    end
end
