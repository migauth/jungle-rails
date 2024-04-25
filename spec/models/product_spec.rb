require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
    let(:category) { Category.create(name: "Test Category") }
    let(:valid_product_attributes) do
      {
        name: "Test Product",
        price_cents: 1000,
        quantity: 10,
        category: category
      }
    end

    it "saves successfully with all fields set" do
      product = Product.new(valid_product_attributes)
      expect(product.save).to be_truthy
    end

    it "validates presence of name" do
      product = Product.new(valid_product_attributes.merge(name: nil))
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "validates presence of price" do
      product = Product.new(valid_product_attributes.merge(price_cents: nil))
      product.save
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it "validates presence of quantity" do
      product = Product.new(valid_product_attributes.merge(quantity: nil))
      product.save
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "validates presence of category" do
      product = Product.new(valid_product_attributes.merge(category: nil))
      product.save
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
