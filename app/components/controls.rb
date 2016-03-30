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
    div id: 'controls' do
      if store.state_voting?
        span class: 'btn btn-primary', onclick: method(:review_points) do
          'Review points'
        end
      elsif store.state_review?
        span class: 'btn btn-default', onclick: method(:vote_again) do
          'Vote Again'
        end
        span class: 'btn btn-primary', onclick: method(:new_ticket) do
          'Next ticket'
        end
      end
    end
  end
end
