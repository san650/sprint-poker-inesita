class Router
  include Inesita::Router

  def routes
    route '/', redirect_to: :new_game_screen
    route '/new-game', to: NewGameScreen
    route '/games/:id', to: PreGameScreen
  end
end
