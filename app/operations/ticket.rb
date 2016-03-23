module Operations
  module Ticket
    def current_ticket
      @game[:tickets][@state[:current_ticket_id].to_s] || {}
    end
  end
end
