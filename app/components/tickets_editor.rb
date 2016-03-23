class TicketsEditor
  include Inesita::Component

  def add_ticket(e)
    if e.code == 13 && e.target.value != nil && e.target.value.strip != ''
      store.add_ticket(e.target.value)
      e.target.value = ''
    end
  end

  def change_ticket_name(id, e)
    if e.target.value != nil && e.target.value.strip != ''
      if e.is_a?(Browser::Event::Keyboard) && e.code == 13
        store.change_ticket_name(id, e.target.value)
        #e.target.trigger(:blur)
        e.stop!
      elsif e.is_a?(Browser::Event::Focus)
        store.change_ticket_name(id, e.target.value)
      end
    end
  end

  def render
    div id: 'tickets-list' do
      h1 do
        store.game[:name]
      end
      ul do
        store.game["tickets"].each_with_index do |(id, ticket), idx|
          li class: 'ticket' do
            div class: 'number' do
              "##{idx+1}"
            end
            div class: 'name' do
              input id: "ticket-#{id}",
                    class: 'form-control',
                    value: ticket["name"],
                    onkeydown: ->(e) { change_ticket_name(id, e) },
                    onblur: ->(e) { change_ticket_name(id, e) }
            end
            div class: 'vote' do
              ticket["pioints"] || '-'
            end
            div class: 'opts' do
              img src: '/static/edit.png',
                onclick: ->(e) { $document["ticket-#{id}"].trigger(:click); e.stop! }
              img src: '/static/delete.png',
                onclick: -> { store.delete_ticket(id) }
            end
          end
        end
      end
      div class: 'new-ticket' do
        span class: 'number' do
          "##{store.game["tickets"].length + 1}"
        end
        input class: 'form-control',
              onkeydown: method(:add_ticket)
      end
    end
  end
end