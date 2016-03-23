module Operations
  module Socket
    def init_socket
      @store = $window.storage(:sprintpoker)
      @auth_token = @store[:auth_token]
      @socket = Phoenix::Socket.new(SOCKET_URI, params: {auth_token: @auth_token})
      @socket.connect
    end

    def connect_to_lobby
      @channel.leave if @channel
      @channel = @socket.channel('lobby', {game_id: router.params[:game_id]})
      @channel.on 'auth_token' do |msg|
        @store[:auth_token] = @auth_token = msg[:auth_token]
      end
      @channel.on 'user' do |msg|
        @user = msg[:user]
        render!
      end
      @channel.on 'decks' do |msg|
        @decks = msg[:decks]
        render!
      end
      @channel.on 'game' do |msg|
        @game = msg[:game]
        router.go_to("/games/#{@game[:id]}")
        connect_to_game if in_game
      end
      @channel.join
    end

    def connect_to_game
      @channel.leave
      @channel = @socket.channel("game:#{router.params[:game_id]}")

      @channel.on 'state' do |msg|
        @state = msg[:state]
        render!
      end

      @channel.on 'game' do |msg|
        @game = msg[:game]
        render!
      end

      @channel.join
    end

    def update_user
      @channel.push 'user:update', {user: @user}
    end

    def create_game
      @channel.push 'game:create', {game: @game}
    end

    def add_ticket(name)
      @channel.push 'ticket:create', {ticket: {name: name}}
    end

    def delete_ticket(id)
      @channel.push 'ticket:delete', {ticket: {id: id}}
    end

    def change_ticket_name(id, name)
      @channel.push 'ticket:update', {ticket: {id: id, name: name}}
    end

    def change_ticket_points(id, poins)
      @channel.push 'ticket:update', {ticket: {id: id, points: points}}
    end

    def change_current_ticket_id(id)
      if id
        @channel.push 'state:update', {state: {current_ticket_id: id, name: 'voting', votes: {}}}
      else
        @channel.push 'state:update', {state: {current_ticket_id: nil, name: 'none', votes: {}}}
      end
    end

    def change_state_name(name = 'review')
      @channel.push 'state:update', {state: {name: name}}
    end

    def change_user_vote(points)
      @channel.push 'state:update:vote', {vote: {points: points}}
    end
  end
end
