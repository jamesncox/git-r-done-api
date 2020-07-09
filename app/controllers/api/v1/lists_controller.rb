class Api::V1::ListsController < ApplicationController
    def index
        @lists = List.all 
        render json: @lists, except: [:created_at, :updated_at], status: 200
    end

    def user_lists
        @user = User.find_by(id: params[:id])
        @lists = @user.lists 
        render json: @lists, except: [:created_at, :updated_at], status: 200
    end

    def show
        @list = List.find_by(id: params[:id])
        render json: @list, status: 200
    end

    def create
        @list = List.new(list_params)
        if @list.save
            render json: @list, include: :todos, status: 200
        else 
            render json: { errors: @list.errors.full_messages}, status: 400
        end 
    end

    def update 
        @list = List.find_by(id: params[:id])
        if @list.update(list_params)
            render json: @list, include: :todos, status: 200
        else 
            render json: { errors: @list.errors.full_messages}, status: 400
        end
    end 

    def destroy
        @list = List.find_by(id: params[:id])
        @list.todos.delete_all
        @list.destroy
        render json: @list, status: 200
    end

    private
        def list_params
            params.require(:list).permit(:category, :color, :user_id)
        end 
end
