module Operations
  module Ticket
    def current_ticket
      @game[:tickets][@state[:currentTicketId].to_s] || {}
    end
  end
end
