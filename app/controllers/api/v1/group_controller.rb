# frozen_string_literal: true

class Api
  class V1
    class GroupController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_group, only: %i[show update destroy add_note_to_group]

      # GET /project/:project_id/group
      def index
        @groups = Group.where(project_id: params[:project_id])
        json_response(@groups)
      end

      # POST /project/:project_id/group
      def create
        @group = Group.create!(group_params)
        json_response(@group, :created)
      end

      # GET /project/:project_id/group/:id
      def show
        response = {
          group: @group,
          notes: @group.notes
        }
        json_response(response)
      end

      # PUT /project/:project_id/group/:id
      def update
        @group.update(group_params)
        head :no_content
      end

      # DELETE /project/:project_id/group/:id
      def destroy
        @group.destroy
        head :no_content
      end

      private

      def group_params
        # whitelist params
        params.permit(:name, :project_id)
      end

      def set_group
        @group = Group.find(params[:id])
      end
    end
  end
end
