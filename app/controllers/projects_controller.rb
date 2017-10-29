class ProjectsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    
    def index
        @project = Project.all
    end

    def new
        @project = Project.new 
    end

    def create
        @project = Project.new project_params

        if @project.save
            redirect_to @project, notice: "Your project was successfully saved."
        else
            render 'new', notice: "Your project was not successfully saved." 
        end
    end

    def show
    end

    def edit
    end

    def destroy
        @project.destroy
        redirect_to projects_path
    end

    def update
        if @project.update project_params
            redirect_to @project, notice: "Your project was successfully updated."
        else
            render 'edit', notice: "Your project was not successfully updated."
        end
    end

    private

    def project_params
        params.require(:project).permit(:title, :description, :link)
    end

    def find_post 
        @project = Project.find(params[:id])
    end
end
