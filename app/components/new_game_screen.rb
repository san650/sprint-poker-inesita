class NewGameScreen
  include Inesita::Component

  def render
      div id: 'new-game-screen', class: 'container' do
        div class: 'row logo' do
          img src: 'static/logo-big.png'
        end
        div class: 'row' do
          div class: 'col-md-6 col-md-offset-3 panel' do
            img class: 'bg bg-1', src: 'static/bg-1.png'
            img class: 'bg bg-2', src: 'static/bg-2.png'
            img class: 'bg bg-3', src: 'static/bg-3.png'
            img class: 'bg bg-4', src: 'static/bg-4.png'
            div class: 'description text-center' do
              "Use online Sprint Poker to easily estimate and plan tickets with your team. Your room will only be seen by those you invite."
            end
            form do
              div class: 'col-md-6 form-group' do
                label { 'Session name:' }
                input class: 'form-control'
              end
              div class: 'col-md-6' do
                label { 'Your name:' }
                input class: 'form-control', value: store.user[:name]
              end
              div class: 'col-md-12' do
                label { 'Session deck:' }
                select class: 'form-control' do
                  store.decks.each do |deck|
                    option value: deck.id do
                      "#{deck.name} (#{deck[:cards].join(",")})"
                    end
                  end
                end
              end
              div class: 'submit col-md-12 text-center' do
                div class: 'btn btn-primary' do
                  'Start voting'
                end
              end
            end
          end
        end
      end
  end
end
