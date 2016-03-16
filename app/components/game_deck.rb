class GameDeck
  include Inesita::Component

  def render
    div class: 'col-md-12' do
      label { 'Session deck:' }
      select class: 'form-control',
             disabled: props[:disabled],
             onchange: ->(e) { store.set(:game_deck_id, e.target.value) } do
        store.decks.each do |deck|
          option value: deck[:id] do
            "#{deck[:name]} (#{deck[:cards].join(",")})"
          end
        end
      end
    end
  end
end
