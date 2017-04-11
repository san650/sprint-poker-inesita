class CreateSessionButton
  include Inesita::Component

  def click
    router.go_to('/new-game')
  end

  def render
    button class: 'btn btn-green', onclick: method(:click) do
      'Create a session'
    end
  end
end
