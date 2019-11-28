require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:product) { create(:product)  }

  describe "validations" do
    it "attributes must not be empty" do
      expect(subject.valid?).to_not be
      expect(subject.errors[:title].size).to eq(1)
      expect(subject.errors[:description].size).to eq(1)
      expect(subject.errors[:price].size).to eq(1)
      expect(subject.errors[:image_url].size).to eq(1)
    end

    context "price" do
      it "will be valid with a postivie number" do
        expect(product.valid?).to be
        expect(product.errors[:price].size).to eq(0)
      end

      it "must be positive" do
        product.price = -1
        expect(product.valid?).to_not be
        expect(product.errors[:price]).to eq(["must be greater than or equal to 0.01"])
      end

      it "must be greater than 1 cent" do
        product.price = 0.0
        expect(product.valid?).to_not be
        expect(product.errors[:price]).to eq(["must be greater than or equal to 0.01"])
      end
    end

    context "image_url" do
      it "will be valid if it has a proper image extension" do

        ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b/c/g/fred.jpg}

        ok.each do |url|
          product.image_url = url
          expect(product.valid?).to be
          expect(product.errors[:image_url].size).to eq(0)
        end
      end

      it "will be not valid if it has an improper or no image extension" do

        bad = %w{ fred.doc fred.jpg/more fred.png.more }

        bad.each do |url|
          product.image_url = url
          expect(product.valid?).to_not be
          expect(product.errors[:image_url]).to eq(["must be a .GIF, .JPG, or PNG image"])
        end
      end
    end

    context "title" do
      context "is not not unique" do
        let (:same_title_product) { build(:product, title: product.title) }

        it "should not be valid" do
          expect(same_title_product.valid?).to_not be
          expect(same_title_product.errors[:title]).to eq(["has already been taken"])
        end
      end
    end
  end
end
