class Api::V1::CategoriesController < ApplicationController
    def index
        @categories = Category.all 
        render json: @stores, except: [:created_at, :updated_at], status: 200
    end

    def user_categories
        @user = User.find_by(id: params[:id])
        @categories = @user.categories 
        render json: @stores, except: [:created_at, :updated_at], status: 200
    end

    def show
        @category = Category.find_by(id: params[:id])
        render json: @category, status: 200
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            render json: @category, include: :items, status: 200
        else 
            render json: { errors: @store.errors.full_messages}, status: 400
        end 
    end

    def update 
        @category = Category.find_by(id: params[:id])
        if @category.update(category_params)
            render json: @category, include: :items, status: 200
        else 
            render json: { errors: @store.errors.full_messages}, status: 400
        end
    end 

    def destroy
        @category = Category.find_by(id: params[:id])
        @category.items.delete_all
        @category.destroy
        render json: @category, status: 200
    end

    private
        def category_params
            params.require(:store).permit(:name, :color, :user_id)
        end 
end
