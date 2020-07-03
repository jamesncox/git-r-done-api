class Api::V1::CategoriesController < ApplicationController
    belongs_to :user
    has_many :items 

    validates :name, presence: { message: "%{value} of store is missing"  }
    validates :color, presence: { message: "%{value} of header not selected" }
end
