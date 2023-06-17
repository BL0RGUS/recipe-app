class IngredientsController < ApplicationController
  before_action :set_recipe
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  # GET recipes/1/ingredients
  def index
    @ingredients = @recipe.ingredients
  end

  # GET recipes/1/ingredients/1
  def show
  end

  # GET recipes/1/ingredients/new
  def new
    @ingredient = @recipe.ingredients.build
  end

  # GET recipes/1/ingredients/1/edit
  def edit
  end

  # POST recipes/1/ingredients
  def create
    @ingredient = @recipe.ingredients.build(ingredient_params)

    if @ingredient.save
      redirect_to(@ingredient.recipe)
    else
      render action: 'new'
    end
  end

  # PUT recipes/1/ingredients/1
  def update
    if @ingredient.update(ingredient_params)
      redirect_to(@ingredient.recipe)
    else
      render action: 'edit'
    end
  end

  # DELETE recipes/1/ingredients/1
  def destroy
    @ingredient.destroy

    redirect_to recipe_ingredients_url(@recipe)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = current_user.recipes.find(params[:recipe_id])
    end

    def set_ingredient
      @ingredient = @recipe.ingredients.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ingredient_params
      params.require(:ingredient).permit(:ingredient, :measurement, :quantity, :recipe_id)
    end
end
