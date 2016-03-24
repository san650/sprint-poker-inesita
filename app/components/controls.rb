class Controls
  include Inesita::Component

  def render
    div id: 'controls' do
      span class: 'btn btn-default', onclick: -> {store.start_game} do
        'Vote Again'
      end
      span class: 'btn btn-primary', onclick: -> {store.start_game} do
        'Next ticket'
      end
    end
  end
end
