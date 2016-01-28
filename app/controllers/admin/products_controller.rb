class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @image = @product.build_image
  end

  def create
    product = Product.new(product_params)

    if product.save
      redirect_to admin_products_path, notice: 'Create product success.'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path, notice: 'Update product success.'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      redirect_to admin_products_path, notice: 'Destroy product success.'
    else
      redirect_to admin_products_path, alert: 'Destroy product failed.'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name,
                                    :description,
                                    image_attributes: [:attachment])
  end
end
