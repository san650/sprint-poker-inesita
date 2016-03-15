class Layout
  include Inesita::Layout

  def render
    component router
    footer do
      img src: '/static/logo-footer.png'
      p { 'Crefted with love at El Passion 2016' }
    end
  end
end
