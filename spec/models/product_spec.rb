require 'rails_helper'

RSpec.describe Product, type: :model do
  

  describe 'Validations' do 
  
  
  it "should save" do     
    @category = Category.new(name: "Test")
    @product = Product.new(name: "car", price_cents: 1000, quantity: 1, :category => @category)
    @product.save      
    expect(@product).to be_valid      

  end
  
  it "should have a name" do     
    @product = Product.new(name: nil)
    @product.save      
    expect(@product).to_not be_valid 
    puts @product.errors[:price_cents]    
    expect(@product.errors[:name ]).to include("can\'t be blank")

  end
    it "should have a category" do     
      @product = Product.new(category: nil)
      @product.save      
      expect(@product).to_not be_valid        
      expect(@product.errors[:category]).to include("can\'t be blank")
    end
    it "price should be number" do     
      @product = Product.new(price: "abc")
      @product.save      
      expect(@product).to_not be_valid        
      expect(@product.errors.full_messages).to include("Price is not a number")
    end
    it "should have a quantity" do     
      @product = Product.new(quantity: nil)
      @product.save      
      expect(@product).to_not be_valid        
      expect(@product.errors[:quantity]).to include("can't be blank")
    end   

  end

end
