class GameDeck
  include Inesita::Component

  def select_deck(e)
    store.set_game_deck_id(e.target.value)
  end

  def render
    div class: 'col-md-12' do
      label { 'Session deck:' }
      select class: 'form-control',
             disabled: props[:disabled],
             onchange: method(:select_deck) do
        store.decks.each do |deck|
          option value: deck[:id] do
            "#{deck[:name]} (#{deck[:cards].join(",")})"
          end
        end
      end
    end
  end
end
