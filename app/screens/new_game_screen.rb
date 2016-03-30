class NewGameScreen
  include Inesita::Component

  def new_game(e)
    store.new_game
  end

  def render
    div id: 'pre-game-screen', class: 'container' do
      div class: 'row logo' do
        img src: '/static/logo-big.png'
      end
      div class: 'row' do
        div class: 'col-md-6 col-md-offset-3 panel' do
          component Background
          div class: 'description text-center' do
            "Use online Sprint Poker to easily estimate and plan tickets with your team. Your room will only be seen by those you invite."
          end
          form do
            component GameName
            component UserName
            component GameDeck
            div class: 'submit col-md-12 text-center' do
              div class: 'btn btn-primary btn-padding', onclick: method(:new_game) do
                'Start voting'
              end
            end
          end
        end
      end
    end
  end
end
