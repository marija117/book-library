class LoanRecordsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_loan_record, only: [:show, :edit, :update, :destroy]

    def index
        @loan_records = LoanRecord.all
    end
  
    def show
    end
  
    def new
        @loan_record = LoanRecord.new
    end
  
    def create
        @loan_record = LoanRecord.new(loan_record_params)

        if member_can_loan_book(params[:user_id], params[:book_id]) && @loan_record.save
          render json: @loan_record
        else
          render json: { errors: @loan_record.errors }, status: 422 
        end
    end
  
    def edit
    end
    
    def update    
        if @loan_record.update(loan_record_params)
          render json: @loan_record
        else
          render json: { errors: @loan_record.errors }, status: 422 
        end
    end
  
    def destroy
        @loan_records = LoanRecord.all
        @loan_record.destroy
    
        render json: @loan_records
    end
    
    def member_can_loan_book(user_id, book_id)
        @book = Book.find(book_id)
        @book.number_of_hard_copies > 0 && LoanRecord.number_of_loaned_books(user_id)
    end

    private

    def set_loan_record
        @loan_record = LoanRecord.find(params[:id]) if params[:id]
    end

    def loan_record_params
      params.require(:loan_record).permit(:user_id, :book_id)
    end
end
