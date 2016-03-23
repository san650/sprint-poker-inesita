class Cards
  include Inesita::Component

  def render
    div id: 'cards', class: 'clearfix' do
      store.game[:deck][:cards].each do |card|
        div class: "card #{"selected" if store.state[:votes][store.user[:id]] == card}",
          onclick: ->(e) {store.change_user_vote(e.target.text)} do
          card
        end
      end
    end
  end
end
