class TicketsEditor
  include Inesita::Component

  def add_ticket(e)
    if e.code == 13
      store.add_ticket(e.target.value)
    end
  end

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
            'As an user I want to create new account'
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
            '12'
          end
        end
      end
      div class: 'new-ticket' do
        span class: 'number' do
          '#1'
        end
        input class: 'form-control',
              onkeydown: method(:add_ticket)
      end
    end
  end
end
