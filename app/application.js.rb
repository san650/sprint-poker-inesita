require 'inesita'
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

$document.ready do
  Inesita::Application.new(
    router: Router,
    store: Store,
    layout: Layout
  ).mount_to($document.body)
end
