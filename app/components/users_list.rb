class UsersList
  include Inesita::Component

  def render
    div class: 'list' do
      ul do
        store.game["users"].each_with_index do |user, idx|
          li class: 'ticket clearfix' do
            div class: 'number' do
              "##{idx+1}"
            end
            div class: 'name' do
              user["name"]
            end
            div class: 'vote' do
              store.state["votes"][user[:id]]
            end
          end
        end

        li class: 'final-estimation-summary' do
          div class: 'img' do
            img src: '/static/final.png'
          end
          span class: 'label' do
            'Final estimation:'
          end
          div class: 'value' do
            text store.game[:tickets][store.state[:current_ticket_id]][:points] || ' - '
          end
        end
      end
    end
  end
end
