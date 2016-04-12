class Cards
  include Inesita::Component

  def disabled?
    !store.state_voting?
  end

  def selected?(card)
    store.state[:votes][store.user[:id]] == card
  end

  def vote(e)
    disabled? ? nil : store.change_user_vote(e.target.text)
  end

  def render
    div class: 'cards clearfix' do
      store.game[:deck][:cards].each do |card|
        div class: "card #{'selected' if selected?(card)} #{'disabled' if disabled? }",
          onclick: method(:vote) do
          card
        end
      end
    end
  end
end
