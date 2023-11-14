class RecipesController < ApplicationController
  def index
    render :index, locals: { recipes: Recipe.all }
  end

  def show
    render :show, locals: { recipe: Recipe.find(params[:id]) }
  end
end
