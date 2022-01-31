require "application_system_test_case"

module Panel
  class TicketsTest < ApplicationSystemTestCase
    setup do
      @panel_ticket = panel_tickets(:one)
    end

    test "visiting the index" do
      visit panel_tickets_url
      assert_selector "h1", text: "Tickets"
    end

    test "should create ticket" do
      visit panel_tickets_url
      click_on "New ticket"

      fill_in "Author", with: @panel_ticket.author_id
      fill_in "Status", with: @panel_ticket.status
      fill_in "Title", with: @panel_ticket.title
      click_on "Create Ticket"

      assert_text "Ticket was successfully created"
      click_on "Back"
    end

    test "should update Ticket" do
      visit panel_ticket_url(@panel_ticket)
      click_on "Edit this ticket", match: :first

      fill_in "Author", with: @panel_ticket.author_id
      fill_in "Status", with: @panel_ticket.status
      fill_in "Title", with: @panel_ticket.title
      click_on "Update Ticket"

      assert_text "Ticket was successfully updated"
      click_on "Back"
    end

    test "should destroy Ticket" do
      visit panel_ticket_url(@panel_ticket)
      click_on "Destroy this ticket", match: :first

      assert_text "Ticket was successfully destroyed"
    end
  end
end
