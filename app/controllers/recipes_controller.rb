# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    render :index, locals: { recipes: Recipe.all }
  end

  def show
    if recipe
      render :show, locals: { recipe: recipe }
    else
      redirect_to recipes_path, notice: 'Recipe not found.'
    end
  end

  def new
    render :new, locals: { recipe: Recipe.new }
  end

  def edit
    render :edit, locals: { recipe: recipe }
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to recipe_path(recipe), notice: 'Recipe was successfully created.'
    else
      render :new, locals: { recipe: recipe }, status: :unprocessable_entity, notice: 'Recipe was not created.'
    end
  end

  def update
    if recipe.update(recipe_params)
      redirect_to recipe_path(recipe), notice: 'Recipe was successfully updated.'
    else
      render :edit, locals: { recipe: recipe }, status: :unprocessable_entity, notice: 'Recipe was not updated.'
    end
  end

  private

  def recipe
    recipe || Recipe.find_by(id: params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :instruction)
  end
end
