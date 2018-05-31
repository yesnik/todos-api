module V1
  class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :update, :destroy]

    def index
      # get current user todos
      @todos = current_user.todos
      json_response(@todos)
    end

    def create
      # create todos belonging to current user
      @todo = current_user.todos.create!(todo_params)
      json_response(@todo, :created)
    end

    def show
      json_response(@todo)
    end

    def update
      @todo.update!(todo_params)
      head :no_content
    end

    def destroy
      @todo.destroy!
      head :no_content
    end

    protected

    def todo_params
      params.permit(:title)
    end

    def set_todo
      @todo = Todo.find(params[:id])
    end
  end
end
