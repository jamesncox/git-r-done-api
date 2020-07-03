class Category < ApplicationRecord
    belongs_to :user
    has_many :todos 

    validates :name, presence: { message: "%{value} of category is missing"  }
    validates :color, presence: { message: "%{value} of header not selected" }
end
