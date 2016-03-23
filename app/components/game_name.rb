class GameName
  include Inesita::Component

  def render
    div class: "col-md-6 form-group #{'has-error' if store.errors[:game_name]}" do
      label { 'Session name:' }
      span class: 'error' do
        store.errors[:game_name]
      end if store.errors[:game_name]
      input class: 'form-control',
        disabled: props[:disabled],
        value: store.game[:name],
        onchange: ->(e) { store.set_game_name(e.target.value) },
        onblur: ->(e) { store.validate_game_name }
    end
  end
end
