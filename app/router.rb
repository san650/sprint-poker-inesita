class Router
  include Inesita::Router

  def routes
    route '/', to: WelcomeScreen
    route '/new-game', to: NewGameScreen
    route '/games/:game_id', to: PreGameScreen
  end
end
