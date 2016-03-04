class Router
  include Inesita::Router

  def routes
    route '/new-game', to: NewGameScreen
  end
end
