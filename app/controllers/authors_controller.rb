class AuthorsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :librarian_only, except: [:index, :show]
    before_action :set_author, only: [:show, :edit, :update, :destroy]

    def index
        @authors = Author.all
    end
  
    def show
    end
  
    def new
        @author = Author.new
    end
  
    def create
        @author = Author.new(author_params)

        if @author.save
          render json: @author
        else
          render json: { errors: @author.errors }, status: 422 
        end
    end
  
    def edit
    end
    
    def update    
        if @author.update(author_params)
          render json: @author
        else
          render json: { errors: @author.errors }, status: 422 
        end
    end
  
    def destroy
        @authors = Author.all
        @author.destroy
    
        render json: @authors
    end
    

    private

    def librarian_only
        unless current_user.librarian?
            redirect_to root_url, :alert => "Access denied."
        end
    end

    def set_author
        @author = Author.find(params[:id]) if params[:id]
    end

    def author_params
      params.require(:author).permit(:name)
    end
end
