class TicketsList
  include Inesita::Component

  def render
    div id: 'tickets-list' do
      h1 do
        store.game[:name]
      end
      ul do
        li class: 'ticket' do
          span class: 'number' do
            '#1'
          end
          span class: 'name' do
            'Tiket numer jestesf'
          end
          span class: 'vote' do
            '5'
          end
        end
        li class: 'ticket' do
          span class: 'number' do
            '#10'
          end
          span class: 'name' do
            'Tiket numer jestesf'
          end
          span class: 'vote' do
            '10'
          end
        end
      end
      div class: 'new-ticket' do
        span class: 'number' do
          '#1'
        end
        input class: 'form-control'
      end
    end
  end
end
