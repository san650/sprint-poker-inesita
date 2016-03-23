class Store
  include Inesita::Store

  include Operations::Socket
  include Operations::Game
  include Operations::User
  include Operations::Ticket

  attr_reader :decks, :user, :errors, :game, :in_game, :state

  def init_state
    @decks = []
    @user = {}
    @state = {
      name: 'none',
      tickets: {},
      votes: {}
    }
    @game = {
      users: [],
      tickets: {},
      owner: {},
      deck: {
        id: 1
      }
    }
    @errors = {}
  end

  def init
    init_state
    init_socket
    connect_to_lobby
  end
end
