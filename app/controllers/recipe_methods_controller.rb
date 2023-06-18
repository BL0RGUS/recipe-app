class RecipeMethodsController < ApplicationController
  before_action :set_recipe
  before_action :set_recipe_method, only: [:show, :edit, :update, :destroy]

  # GET recipes/1/recipe_methods
  def index
    @recipe_methods = @recipe.recipe_methods
  end

  # GET recipes/1/recipe_methods/1
  def show
  end

  # GET recipes/1/recipe_methods/new
  def new
    @recipe_method = @recipe.recipe_methods.build
  end

  # GET recipes/1/recipe_methods/1/edit
  def edit
  end

  # POST recipes/1/recipe_methods
  def create
    @recipe_method = @recipe.recipe_methods.build(recipe_method_params)

    if @recipe_method.save
      redirect_to(@recipe_method.recipe)
    else
      render action: 'new'
    end
  end

  # PUT recipes/1/recipe_methods/1
  def update
    if @recipe_method.update_attributes(recipe_method_params)
      redirect_to(@recipe_method.recipe)
    else
      render action: 'edit'
    end
  end

  # DELETE recipes/1/recipe_methods/1
  def destroy
    @recipe_method.destroy

    redirect_to(@recipe_method.recipe)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = current_user.recipes.find(params[:recipe_id])
    end

    def set_recipe_method
      @recipe_method = @recipe.recipe_methods.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_method_params
      params.require(:recipe_method).permit(:step, :details, :recipe_id)
    end
end
