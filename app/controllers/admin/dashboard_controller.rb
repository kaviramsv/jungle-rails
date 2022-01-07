class Admin::DashboardController < ApplicationController
  
  def show
    @category_count = Category.all.count
    @product_count = Product.all.count
    puts @product_count
    puts @category_count
  end
end
