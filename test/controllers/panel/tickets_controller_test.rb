require "test_helper"

module Panel
  class TicketsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @panel_ticket = panel_tickets(:one)
    end

    test "should get index" do
      get panel_tickets_url
      assert_response :success
    end

    test "should get new" do
      get new_panel_ticket_url
      assert_response :success
    end

    test "should create panel_ticket" do
      assert_difference("Panel::Ticket.count") do
        post panel_tickets_url, params: { panel_ticket: { author_id: @panel_ticket.author_id, status: @panel_ticket.status, title: @panel_ticket.title } }
      end

      assert_redirected_to panel_ticket_url(Panel::Ticket.last)
    end

    test "should show panel_ticket" do
      get panel_ticket_url(@panel_ticket)
      assert_response :success
    end

    test "should get edit" do
      get edit_panel_ticket_url(@panel_ticket)
      assert_response :success
    end

    test "should update panel_ticket" do
      patch panel_ticket_url(@panel_ticket), params: { panel_ticket: { author_id: @panel_ticket.author_id, status: @panel_ticket.status, title: @panel_ticket.title } }
      assert_redirected_to panel_ticket_url(@panel_ticket)
    end

    test "should destroy panel_ticket" do
      assert_difference("Panel::Ticket.count", -1) do
        delete panel_ticket_url(@panel_ticket)
      end

      assert_redirected_to panel_tickets_url
    end
  end
end
