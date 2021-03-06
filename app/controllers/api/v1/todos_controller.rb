class Api::V1::TodosController < ApplicationController
    def index
        @todos = Todo.all 
        render json: @todos, except: [:created_at, :updated_at], status: 200
    end

    def user_todos
        @user = User.find_by(id: params[:id])
        @todos = @user.todos
        render json: @todos, except: [:created_at, :updated_at],  status: 200
    end 

    def show
        @todo = Todo.find_by(id: params[:id])
        render json: @todo, include: :list, status: 200
    end

    def create 
        @todo = Todo.new(todo_params)
        @list = List.find_by(id: params[:list_id])
        if @todo.save
            render json: @todo, status: 200
        else
            render json: { errors: @todo.errors.full_messages}, status: 400
        end
    end 

    def update
        @todo = Todo.find_by(id: params[:id])
        if @todo.update(todo_params)
            render json: @todo, status: 200
        else
            render json:  { errors: @todo.errors.full_messages}, status: 400
        end
    end

    def destroy
        @todo = Todo.find_by(id: params[:id])
        @todo.destroy
        render json: @todo, status: 200
    end

    private 
    def todo_params
        params.require(:todo).permit(:text, :priority, :complete, :list_id)
    end
end
