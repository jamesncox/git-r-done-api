class Todo < ApplicationRecord
    belongs_to :category
    has_one :user, through: :categories

    validates :text, presence: true
    validates :priority, presence: true
    validates :complete, presence: true 
end
