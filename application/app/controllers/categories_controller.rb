class CategoriesController < ApplicationController
  # layout false
  layout 'admin'
  before_action :check_log
  
  def index
    @category = Category.sort
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @counter = Category.count + 1
  end

  def create
    @category = Category.new(category_params)
     if @category.save
      flash[:notice] = "Category '#{@category.name}' created."
      redirect_to(:action => 'index')
    else
      @counter = Category.count + 1
      flash[:danger] = "WARNING!!! You cannot create the category!"
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
      flash[:notice] = "Category '#{@category.name}' updated."
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
    flash[:notice] = "Category '#{category.name}' deleted."
    redirect_to(:action => 'index')
  end

  private
  
  def category_params
    params.require(:category).permit(:name, :position, :visibility)
  end
end
