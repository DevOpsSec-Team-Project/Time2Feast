class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    # @recipe = Recipe.new
    @recipe = current_user.recipes.build
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @recipe.parsed_ingredients = params[:recipe][:ingredients].reject(&:blank?)
    @recipe.parsed_steps = params[:recipe][:steps].reject(&:blank?)
  
    if @recipe.save
      redirect_to @recipe, notice: "Recipe was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end  

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy!

    redirect_to root_path

=begin
    respond_to do |format|
      format.html { redirect_to recipes_path, status: :see_other, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
=end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:name, :duration, :minutes, :hours, ingredients: [], steps: [])
    end
end
