require 'rails_helper'

RSpec.describe Product, type: :model do

    before(:each) do
      @category = Category.new(name: "Awesome tings")
      @product = @category.products.new(name: "Magical spoon", price: 100, quantity: 30)
    end

    it "should create a product successfully with the four required fields" do
      expect(@product.save).to be(true)
    end

    it "should not save the product if it does not have a name" do
      @product.name = nil
      expect(@product.save).to be(false)
    end

    it "should not save the product if it does not have a price" do
      @product.price_cents = nil
      expect(@product.valid?).to be(false) #can also use .save
    end

    it "should not save the product if it does not have a quantity" do
      @product.quantity = nil
      expect(@product.save).to be(false)
    end

    it "should not save the product if it does not have a category" do
      @product.category = nil
      expect(@product.save).to be(false)
    end





end
