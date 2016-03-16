class Store
  include Inesita::Store

  attr_reader :decks, :user, :errors, :game, :in_game, :state

  def init
    @store = $window.storage(:sprintpoker)
    @auth_token = @store[:auth_token]
    @decks = []
    @user = {}
    @state = {}
    @game = {
      users: [],
      tickets: [],
      owner: {},
      deck: {
        id: 1
      }
    }
    @errors = {}
    @socket = Phoenix::Socket.new(SOCKET_URI, params: {auth_token: @auth_token})
    @socket.connect
    connect_to_lobby
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
      $console.log msg.inspect
      render!
    end

    @channel.on 'game' do |msg|
      $console.log msg.inspect
      @game = msg[:game]
      render!
    end

    @channel.join
  end

  def validate(what)
    case what
    when :user_name
      @errors[:user_name] = nil
      @errors[:user_name] = 'required' if !@user[:name] || @user[:name].strip.empty?
      @errors[:user_name] = 'too long' if @user[:name] && @user[:name].length > 100
      @channel.push('user:update', {user: @user})
    when :game_name
      @errors[:game_name] = nil
      @errors[:game_name] = 'required' if !@game[:name] || @game[:name].strip.empty?
      @errors[:game_name] = 'too long' if @game[:name] && @game[:name].length > 100
    end
    render!
  end

  def valid?(what)
    case what
    when :user_name
      @errors[:user_name] == nil
    when :game_name
      @errors[:game_name] == nil
    when :game
      @errors[:user_name] == nil && @errors[:game_name] == nil
    end
  end

  def set(what, value)
    case what
    when :user_name
      @user[:name] = value || ""
    when :game_name
      @game[:name] = value
    when :game_deck_id
      @game[:deck][:id] = value
    end
  end

  def new_game
    validate(:user_name)
    validate(:game_name)
    if valid?(:game)
      @channel.push('game:create', @game)
      @in_game = true
    end
    render!
  end

  def join_game
    validate(:user_name)
    if valid?(:game)
      @in_game = true
      connect_to_game
    end
    render!
  end
end
