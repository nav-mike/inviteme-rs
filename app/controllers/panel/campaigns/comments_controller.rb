module Panel
  module Campaigns
    class CommentsController < ApplicationController
      before_action :set_comment, only: %i[show edit update destroy]

      # GET /comments or /comments.json
      def index
        @comments = Comment.all
      end

      # GET /comments/1 or /comments/1.json
      def show(); end

      # GET /comments/new
      def new
        @campaign = Campaign.find(params[:campaign_id])
        @comment = @campaign.comments.new(user: current_user)
      end

      # GET /comments/1/edit
      def edit(); end

      # POST /comments or /comments.json
      def create
        @comment = Comment.new(
          comment_params.merge(campaign_id: params[:campaign_id], user_id: current_user.id)
        )

        respond_to do |format|
          if @comment.save
            format.html { redirect_to panel_campaign_path(@comment.campaign_id), notice: "Comment was successfully created." }
            format.json { render :show, status: :created, location: @comment }
            format.turbo_stream do
              @comment.broadcast_append_to_campaign current_user
              @comment.broadcast_hide_form
              redirect_to panel_campaign_path(@comment.campaign_id)
            end
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @comment.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /comments/1 or /comments/1.json
      def update
        respond_to do |format|
          if @comment.update(comment_params)
            format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
            format.json { render :show, status: :ok, location: @comment }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @comment.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /comments/1 or /comments/1.json
      def destroy
        @comment.destroy

        respond_to do |format|
          format.html { redirect_to panel_campaign_path(@campaign), notice: "Comment was successfully destroyed." }
          format.json { head :no_content }
          format.turbo_stream { turbo_stream.remove @comment }
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        @campaign = Campaign.find(params[:campaign_id])
        @comment = @campaign.comments.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def comment_params
        params.require(:comment).permit(:content, :user_id, :campaign_id)
      end
    end
  end
end
