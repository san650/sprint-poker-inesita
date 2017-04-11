class Router
  include Inesita::Router

  def routes
    route '/', to: WelcomeScreen
    route '/new-game', to: NewGameScreen, on_enter: -> { store.connect_to_lobby }
    route '/games/:game_id', to: PreGameScreen, on_enter: -> { store.connect_to_lobby }
  end
end
