class GameScreen
  include Inesita::Component

  def render
    div id: 'game-screen', class: 'container' do
      div class: 'col-md-12 logo' do
        img src: '/static/logo-big.png'
      end
      div class: 'col-md-12 panel' do
        div class: 'col-md-8' do
          component Background
          if store.state[:name] == 'none'
            h1 do
              store.game[:name]
            end
            if store.user_admin?
              component TicketsEditor
            else
              component TicketsList
              text 'wait for adding tickets...'
            end
          else
            h1 do
              store.current_ticket[:name]
            end
            h5 do
              text "Ticket #{store.game["tickets"].keys.index(store.state[:current_ticket_id]) + 1} of #{store.game["tickets"].size}"
            end
            component Cards
            component UsersList
            component FinalEstimation
            if store.user_admin?
              component Controls
            end
          end
        end
        div class: 'col-md-4 sidebar' do
          component GameSidebar
        end
      end
    end
  end
end
