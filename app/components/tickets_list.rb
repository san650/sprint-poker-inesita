class TicketsList
  include Inesita::Component

  def add_ticket(e)

  end

  def render
    div id: 'list' do
      ul do
        store.game["tickets"].values.each_with_index do |ticket, idx|
          li class: 'ticket clearfix' do
            div class: 'number' do
              "##{idx+1}"
            end
            div class: 'name' do
              ticket["name"]
            end
            div class: 'vote' do
              ticket["points"] || '-'
            end
          end
        end
      end
    end
  end
end
