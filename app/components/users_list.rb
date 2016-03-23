class UsersList
  include Inesita::Component

  def add_ticket(e)

  end

  def render
    div id: 'list' do
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
      end
    end
  end
end
