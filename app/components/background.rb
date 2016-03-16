class Background
  include Inesita::Component

  def render
    img class: 'bg bg-1', src: '/static/bg-1.png'
    img class: 'bg bg-2', src: '/static/bg-2.png'
    img class: 'bg bg-3', src: '/static/bg-3.png'
    img class: 'bg bg-4', src: '/static/bg-4.png'
  end
end
