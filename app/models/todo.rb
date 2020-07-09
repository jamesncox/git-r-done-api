class Todo < ApplicationRecord
    belongs_to :list
    has_one :user, through: :lists

    validates :text, presence: true
    validates :priority, presence: true
    validates :complete, presence: true 
end
