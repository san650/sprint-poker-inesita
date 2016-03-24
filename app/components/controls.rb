class Controls
  include Inesita::Component

  def render
    div id: 'controls' do
      if store.state[:name] == 'voting'
        span class: 'btn btn-primary', onclick: -> {store.change_state_name(:review)} do
          'Review points'
        end
      elsif store.state[:name] == 'review'
        span class: 'btn btn-default', onclick: -> {store.change_current_ticket_id(store.state[:current_ticket_id])} do
          'Vote Again'
        end
        span class: 'btn btn-primary', onclick: -> {store.start_game} do
          'Next ticket'
        end
      end
    end
  end
end
