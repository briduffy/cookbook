class Api::RecipeIngredientsController < ApplicationController
  def new
    ingredients = Ingredient.all.map { |i| {name: i.name, i: id.id } }
    render json: ingredient
  end

  def create
    recipe_ingredient = RecipeIngredient.new(rec_ing_params)

    if recipe_ingredient.save
      render json: recipe_ingredient
    else
      render_error(recipe_ingredient)
    end
  end

  def destroy
    RecipeIngredient.find(params[:id]).destroy
  end

  private
  def rec_ing_params
    params.require(:recipe_ingredient).permit(:recipe_id, :ingredient_id, :amount)
  end
end
