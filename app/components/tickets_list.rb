class TicketsList
  include Inesita::Component

  def add_ticket(e)

  end

  def render
    div class: 'list' do
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
      div class: 'info' do
        img class: 'hourglass', src: '/static/hourglass.png'
        h4 { 'Wait for some tickets which will be added by admin.' }
      end
    end
  end
end
