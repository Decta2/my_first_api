class Api::V1::FoodsController < ApiController
  before_action :set_food, only: %i[ show edit update destroy ]

  # GET /foods or /foods.json
  def index
    @foods = Food.all
    render json: @foods

  end

  # GET /foods/1 or /foods/1.json
  def show
    render json:@food
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)
    if @food.save
      render json: @food, status: :created, location: @food
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    if @food.update(food_params)
      render json: @food
    else
      render json: @food.errors, status: :unprocessable_entity
      end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy
      
    if @food.destroy
      head :no_content
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:description, :dish, :fruits)
    end
end
