require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "is a valid product when all fields are provided" do
      @category = Category.create(name: "Test Category")
      @product = Product.new(
        name: "Test Product",
        description: "This is a test",
        category: @category,
        quantity: 8,
        price: 12
      )
      expect(@product).to be_valid
    end

    it "is not a valid product if name wasn't provided" do 
      @category = Category.create(name: "Test Category")
      @product = Product.new(
        name: nil,
        description: "This is a test",
        category: @category,
        quantity: 18,
        price: 50
      )
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "is not a valid product if price wasn't provided" do 
      @category = Category.create(name: "Test Category")
      @product = Product.new(
        name: "Test Product",
        description: "This is a test",
        category: @category,
        quantity: 18,
        price: ''
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price is not a number")
    end

    it "is not a valid product if quantity wasn't provided" do 
      @category = Category.create(name: "Test Category")
      @product = Product.new(
        name: "Test Product",
        description: "This is a test",
        category: @category,
        quantity: nil,
        price: 30
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is not a valid product if category wasn't provided" do 
      @category = Category.create(name: "Test Category")
      @product = Product.new(
        name: "Test Product",
        description: "This is a test",
        category: nil,
        quantity: 20,
        price: 30
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end 
