class Item < ApplicationRecord
    belongs_to :category
    has_one :user, through: :categories

    validates :text, presence: true
end
