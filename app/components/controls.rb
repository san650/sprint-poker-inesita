class Controls
  include Inesita::Component

  def review_points(e)
    store.change_state_name(:review)
  end

  def vote_again(e)
    store.change_current_ticket_id(store.state[:current_ticket_id])
  end

  def new_ticket(e)
    store.start_game
  end

  def render
    div class: 'controls' do
      button class: 'btn btn-default', disabled: store.state_voting?, onclick: method(:vote_again) do
        'Vote Again'
      end
      button class: 'btn btn-primary pull-right', disabled: store.state_voting?, onclick: method(:new_ticket) do
        'Next ticket'
      end
      button class: 'btn btn-primary pull-right', disabled: store.state_review?, onclick: method(:review_points) do
        'Review points'
      end
    end
  end
end
