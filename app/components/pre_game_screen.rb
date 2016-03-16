class PreGameScreen
  include Inesita::Component

  def render
    if store.in_game
      component GameScreen
    else
      component JoinGameScreen
    end
  end
end
