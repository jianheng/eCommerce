class Asset < ActiveRecord::Base
  belongs_to :viewable, polymorphic: true, touch: true
end
