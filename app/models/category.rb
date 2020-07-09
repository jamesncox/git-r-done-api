class List < ApplicationRecord
    belongs_to :user
    has_many :todos 

    validates :category, presence: { message: "%{value} name of list is missing"  }
    validates :color, presence: { message: "%{value} of header not selected" }
end
