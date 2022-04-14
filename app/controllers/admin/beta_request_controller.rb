module Admin
  class BetaRequestController < ApplicationController
    attr_reader :beta_request

    def create
      @beta_request = Admin::BetaRequest.new(beta_request_params)
      respond_to do |format|
        if @beta_request.save
          format.html { redirect_to root_path, notice: 'Beta request was successfully created.' }
          format.json { render :show, status: :created, location: @beta_request }
        else
          format.html { render :new }
          format.json { render json: @beta_request.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def beta_request_params
      params.require('beta_request').permit(:email, :full_name, :company_name)
    end
  end
end
