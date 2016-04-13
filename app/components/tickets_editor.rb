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
        e.target.to_n.JS.blur()
      elsif e.is_a?(Browser::Event::Focus)
        store.change_ticket_name(id, e.target.value)
      end
    end
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
              input id: "ticket-#{ticket[:id]}",
                    class: 'form-control',
                    value: ticket["name"],
                    onkeydown: ->(e) { change_ticket_name(ticket[:id], e) },
                    onblur: ->(e) { change_ticket_name(ticket[:id], e) }
            end
            div class: 'vote' do
              ticket["points"] || '-'
            end
            div class: 'opts' do
              img class: 'edit', src: '/static/edit.png',
                onclick: -> { $document["ticket-#{ticket[:id]}"].to_n.JS.focus() }
              img class: 'delete', src: '/static/delete.png',
                onclick: -> { store.delete_ticket(ticket[:id]) }
            end
          end
        end
      end
      div class: 'new-ticket clearfix' do
        span class: 'number' do
          "##{store.game["tickets"].length + 1}"
        end
        input class: 'form-control',
              onkeydown: method(:add_ticket)
      end
      if store.game["tickets"].empty?
        div class: 'info' do
          img class: 'box', src: '/static/box.png'
          h4 { 'Add your first ticket to the list above.' }
        end
      else
        div class: 'submit' do
          span class: 'btn btn-primary btn-padding', onclick: -> {store.start_game} do
            'Start voting'
          end
        end
      end
    end
  end
end
