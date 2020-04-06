require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'ensures that a product will save properly' do
      category = Category.create(name: "Apparel")
      product = Product.create(name: "this", price: 234333, quantity: 2, category: category)
      expect(product).to be_present
    end
    it 'ensures name is present' do
      category = Category.create(name: "Apparel")
      product = Product.create(name: nil, price: 234333, quantity: 2, category: category)
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
    it 'ensures price is present' do
        category = Category.create(name: "Apparel")
        product = Product.create(name: "thing", price: nil, quantity: 2, category: category)
        expect(product.errors.full_messages).to include("Price can't be blank")
    end
    it 'ensures quantity is present' do
      category = Category.create(name: "Apparel")
      product = Product.create(name: "thing", price: 212345, quantity: nil, category: category)
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'ensures category is present' do
      category = Category.create(name: "Apparel")
      product = Product.create(name: "thing", price: 123434, quantity: 2, category: nil)
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
