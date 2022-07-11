class AuthorsController < ApplicationController
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
            redirect_to @author
        else
            render :new, status: :unprocessable_entity
        end
    end
  
    def edit
    end
    
    def update    
        if @author.update(author_params)
          redirect_to @author
        else
          render :edit, status: :unprocessable_entity
        end
    end
  
    def destroy
        @author.destroy
    
        redirect_to root_path, status: :see_other
    end
    

    private

    def set_author
        @author = Author.find(params[:id]) if params[:id]
    end

    def author_params
      params.require(:author).permit(:name)
    end
end
