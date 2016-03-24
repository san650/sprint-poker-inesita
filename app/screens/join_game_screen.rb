class JoinGameScreen
  include Inesita::Component

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
          div class: 'description text-center' do
            text "Join "
            b { store.game[:name] }
            text " session created by "
            b { store.game[:owner][:name] }
            text " ?"
          end
          form do
            component GameName, props: { disabled: true }
            component UserName
            component GameDeck, props: { disabled: true }
            div class: 'submit col-md-12 text-center' do
              div class: 'btn btn-primary btn-padding', onclick: -> {store.join_game} do
                'Start voting'
              end
            end
          end
        end
      end
    end
  end
end
