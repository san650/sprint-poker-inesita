class GameScreen
  include Inesita::Component

  def render
    div id: 'game-screen', class: 'row' do
      div class: 'col-md-8 col-md-offset-2 logo' do
        img src: '/static/logo-big.png'
      end
      div class: 'col-md-8 col-md-offset-2 panel' do
        div class: 'col-md-8' do
          h1 { "Sdf" }
        end
        div class: 'col-md-4 sidebar' do
          component GameSidebar
        end
      end
    end
  end
end
