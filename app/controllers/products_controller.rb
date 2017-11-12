class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  def show
    @product = Product.find_by(id: params[:id])
    render plain: @product.description
  end

  def inventory
    product = Product.find_by(id: params[:id])
    render plain: product.inventory > 0 ? true : false
  end

  def description
    description = Product.find_by(id: params[:id]).description
    render plain: description
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :price, :inventory)
  end

end
