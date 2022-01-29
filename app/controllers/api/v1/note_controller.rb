# frozen_string_literal: true

class Api
  class V1
    class NoteController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_note, only: %i[show update destroy add_note_to_note]

      # GET /project/:project_id/group/:group_id/note
      def index
        @notes = Note.where(group_id: params[:group_id])
        json_response(@notes)
      end

      # POST /project/:project_id/group/:group_id/note
      def create
        @note = Note.create!(note_params)
        json_response(@note, :created)
      end

      # GET /project/:project_id/group/:group_id/note/:id
      def show
        json_response(@note)
      end

      # PUT/project/:project_id/group/:group_id/note/:id
      def update
        @note.update(note_params)
        head :no_content
      end

      # DELETE /project/:project_id/group/:group_id/note/:id
      def destroy
        @note.destroy
        head :no_content
      end

      private

      def note_params
        # whitelist params
        params.permit(:title, :content, :reference, :group_id)
      end

      def set_note
        @note = Note.find(params[:id])
      end
    end
  end
end
