require 'inesita'
require 'inesita-router'
require 'virtual_dom/support/browser'

require 'phoenix'

require 'browser'
require 'browser/storage'

require_tree './operations'
require_tree './components'
require_tree './screens'

require 'config'
require 'router'
require 'store'
require 'layout'


class Application
  include Inesita::Component

  inject Store
  inject Router

  def render
    component router
    footer do
      img src: '/static/logo-footer.png'
      p { 'Crefted with love at El Passion 2016' }
    end
  end
end

$document.ready do
  Application.mount_to($document.body)
end
