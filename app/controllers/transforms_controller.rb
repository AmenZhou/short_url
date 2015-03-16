class TransformsController < ApplicationController
  before_action :set_transform, only: [:show, :edit, :update, :destroy]

  # GET /transforms
  # GET /transforms.json
  def index
    @transforms = Transform.all
  end

  # GET /transforms/1
  # GET /transforms/1.json
  def show
  end

  # GET /transforms/new
  def new
    @transform = Transform.new
  end

  # GET /transforms/1/edit
  def edit
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

  # PATCH/PUT /transforms/1
  # PATCH/PUT /transforms/1.json
  def update
    respond_to do |format|
      if @transform.update(transform_params)
        format.html { redirect_to @transform, notice: 'Transform was successfully updated.' }
        format.json { render :show, status: :ok, location: @transform }
      else
        format.html { render :edit }
        format.json { render json: @transform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transforms/1
  # DELETE /transforms/1.json
  def destroy
    @transform.destroy
    respond_to do |format|
      format.html { redirect_to transforms_url, notice: 'Transform was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transform
      @transform = Transform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transform_params
      params.require(:transform).permit(:long_url, :short_url)
    end
end
