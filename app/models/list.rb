class List < ApplicationRecord
    belongs_to :user
    has_many :todos 

    validates :category, presence: { message: "%{value} name of list is missing"  }, uniqueness: { scope: :user_id, message: "%{value} Is Already Created" }
end