require 'inesita'
require 'phoenix'
require 'browser/storage'

require 'config'
require 'router'
require 'store'
require 'layout'

require_tree './components'

$document.ready do
  Inesita::Application.new(
    router: Router,
    store: Store,
    layout: Layout
  ).mount_to($document.body)
end
