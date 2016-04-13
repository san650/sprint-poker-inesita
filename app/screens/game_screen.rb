class GameScreen
  include Inesita::Component

  def render
    div class: 'container game-screen' do
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
            end
          else
            h1 do
              store.current_ticket[:name]
            end
            h5 do
              text "Ticket #{store.game["tickets"].keys.index(store.state[:current_ticket_id]) + 1} of #{store.game["tickets"].size}"
            end
            if store.state_voting?
              component Cards
            else
              component FinalEstimation
            end
            component UsersList
            if store.user_admin?
              component Controls
            else
              component Guide
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
