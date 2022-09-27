class EntriesController < ApplicationController
    before_action :authenticate_user!
    def index 
        @entries = current_user.entries.all
    end 

    def show 
        @entry = current_user.entries.find(params[:id])
    end 

    def new 
        @entry = current_user.entries.new
    end 

    def create 
        @entry = current_user.entries.create(entry_params)

        if @entry.save 
            flash[:success] = "Successful creation of Diary entry"
            redirect_to @entry
        else 
            flash[:error] = "Creation of Diary entry failed!"
            render :new 
        end 
    end 

    def edit 
        @entry = current_user.entries.find(params[:id])
    end 

    def update 
        @entry = current_user.entries.find(params[:id])

        if @entry.update(entry_params)
            flash[:success] = "Successful update of Diary entry"
            redirect_to @entry
        else 
            flash[:error] = "Update of Diary entry failed!"
            render :edit 
        end 
    end 

    def destroy 
        @entry = current_user.entries.find(params[:id])
        @entry.destroy

        redirect_to root_path
    end 

    private 
    def entry_params 
        params.require(:entry).permit(:feeling, :body, :user_id, :entry_id)
    end 
end
