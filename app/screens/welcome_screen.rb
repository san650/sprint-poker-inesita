class WelcomeScreen
  include Inesita::Component

  def render
    div class: 'welcome-screen' do
      div class: 'intro' do
        img src: '/static/logo-white.png'
        h2 'Easiest tool for your team\'s regular weekly sprint planning sessions'
        component CreateSessionButton
      end
      img class: 'example', src: '/static/example.png'
      ul class: 'features' do
        li do
          img src: '/static/friendly.png'
          h3 "Friendly"
        end
        li do
          img src: '/static/free.png'
          h3 "Absolutely free"
        end
        li do
          img src: '/static/beautiful.png'
          h3 "Fast & beautiful"
        end
      end
      div class: 'outro' do
        h2 'Easiest tool for your team\'s regular weekly sprint planning sessions'
        component CreateSessionButton
      end
    end
  end
end
