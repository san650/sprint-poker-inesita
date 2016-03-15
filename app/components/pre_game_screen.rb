class PreGameScreen
  include Inesita::Component

  def render
    if store.current_game
      component GameScreen
    else
      component JoinGameScreen
    end
  end
end
