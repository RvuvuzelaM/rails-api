# frozen_string_literal: true

class Api
  class V1
    class ProjectController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_project, only: %i[show update destroy add_note_to_group]

      # GET /project
      def index
        @projects = Project.all
        json_response(@projects)
      end

      # POST /project
      def create
        @project = Project.create!(project_params)
        json_response(@project, :created)
      end

      # GET /project/:id
      def show
        response = {
          project: @project,
          groups: @project.groups
        }
        json_response(response)
      end

      # PUT /project/:id
      def update
        @project.update(project_params)
        head :no_content
      end

      # DELETE /project/:id
      def destroy
        @project.destroy
        head :no_content
      end

      private

      def project_params
        # whitelist params
        params.permit(:name)
      end

      def set_project
        @project = Project.find(params[:id])
      end
    end
  end
end
