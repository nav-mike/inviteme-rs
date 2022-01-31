module Panel
  class TicketsController < Panel::ApplicationController
    before_action :set_ticket, only: %i[show edit update destroy]

    # GET /panel/tickets or /panel/tickets.json
    def index
      @tickets = Ticket.all
    end

    # GET /panel/tickets/1 or /panel/tickets/1.json
    def show(); end

    # GET /panel/tickets/new
    def new
      @ticket = Ticket.new
    end

    # GET /panel/tickets/1/edit
    def edit(); end

    # POST /panel/tickets or /panel/tickets.json
    def create
      @ticket = Ticket.new(ticket_params)

      respond_to do |format|
        if @ticket.save
          format.html { redirect_to panel_ticket_url(@ticket), notice: "Ticket was successfully created." }
          format.json { render :show, status: :created, location: @ticket }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /panel/tickets/1 or /panel/tickets/1.json
    def update
      respond_to do |format|
        if @ticket.update(panel_ticket_params)
          format.html { redirect_to panel_ticket_url(@ticket), notice: "Ticket was successfully updated." }
          format.json { render :show, status: :ok, location: @ticket }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /panel/tickets/1 or /panel/tickets/1.json
    def destroy
      @ticket.destroy

      respond_to do |format|
        format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:title, :author_id, :text, :status)
    end
  end
end
