class CategoriesController < ApplicationController
  layout false

  def index
    @category = Category.sort
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category_form = Category.new({:name => 'Put category name'})
    @counter = Category.count + 1
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to(:action => 'index')
    else
      @counter = Category.count + 1
      render('new')
    end
  end

  def edit
    @category = Category.find(params[:id])
    @counter = Category.count
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to(:action => 'show', :id => @category.id)
    else
      @counter = Category.count
      render('edit')
    end
  end  

  def delete
    @category = Category.find(params[:id])  
  end

  def remove
    category = Category.find(params[:id]).destroy
    redirect_to(:action => 'index')  
  end  

  def category_params
    params.require(:category).permit(:name, :position, :visibility)
  end
end