class Product < ActiveRecord::Base
  has_one :image, as: :viewable, dependent: :destroy
  accepts_nested_attributes_for :image, reject_if: :all_blank, allow_destroy: true
end
