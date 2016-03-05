class Store
  include Inesita::Store

  attr_reader :decks, :user

  def initialize
    @store = $window.storage(:sprintpoker)
    @auth_token = @store[:auth_token]
    @decks = []
    @user = {}
    @socket = Phoenix::Socket.new(SOCKET_URI, auth_token: @auth_token)
    @socket.connect
    connect_to_lobby
  end

  def connect_to_lobby
    @channel = @socket.channel('lobby')
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
		@channel.join
  end
end
