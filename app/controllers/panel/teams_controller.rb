module Panel
  class TeamsController < ApplicationController
    before_action :set_panel_team, only: %i[show edit update destroy]

    # GET /panel/teams or /panel/teams.json
    def index
      @panel_teams = Panel::Team.all
    end

    # GET /panel/teams/1 or /panel/teams/1.json
    def show; end

    # GET /panel/teams/new
    def new
      @panel_team = Panel::Team.new
    end

    # GET /panel/teams/1/edit
    def edit; end

    # POST /panel/teams or /panel/teams.json
    def create
      @panel_team = Panel::Team.new(panel_team_params)

      respond_to do |format|
        if @panel_team.save
          Notification.create title: 'New team',
                              message: "New team #{@panel_team.name} has been created",
                              user: current_user,
                              message_type: 'success'
          @panel_team.users << current_user
          current_user.update current_team: @panel_team
          format.html { redirect_to panel_path, notice: "Team was successfully created." }
          format.json { render :show, status: :created, location: @panel_team }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @panel_team.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /panel/teams/1 or /panel/teams/1.json
    def update
      respond_to do |format|
        if @panel_team.update(panel_team_params)
          format.html do
            redirect_to panel_team_url(@panel_team), notice: "Team was successfully updated."
            @panel_team.update_team_turbo current_user
          end
          format.json { render :show, status: :ok, location: @panel_team }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @panel_team.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /panel/teams/1 or /panel/teams/1.json
    def destroy
      @panel_team.destroy

      respond_to do |format|
        format.html { redirect_to panel_teams_url, notice: "Team was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_panel_team
      @panel_team = Panel::Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def panel_team_params
      params.require(:panel_team).permit(:name, :logo)
    end
  end
end
