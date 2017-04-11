class GameSidebar
  include Inesita::Component

  def select_all(e)
    e.target.to_n.JS.setSelectionRange(0, e.target.value.length)
  end

  def render
    form do
      div class: 'form-group' do
        label { 'Session name:' }
        input class: 'form-control',
          disabled: true,
          value: store.game[:name]
      end
      ul class: 'users form-group' do
        label { "Users (#{store.game[:users].count}):" }
        store.game[:users].each do |user|
          li do
            text user[:name]
            if user[:id] == store.game[:owner][:id]
              span class: 'owner' do
                'OWNER'
              end
            end
            if user[:id] == store.user[:id]
              span class: 'you' do
                'YOU'
              end
            end
            if user[:state] != 'connected'
              span class: 'offline' do
                'OFFLINE'
              end
            end
          end
        end
      end
      div class: 'links form-group' do
        label { 'Session link:' }
        input class: 'form-control',
          onclick: method(:select_all),
          value: "http://sprintpoker.io/games/#{store.game[:id]}"
      end
      div class: 'form-group' do
        label { 'Mobile session link:' }
        input class: 'form-control',
          onclick: method(:select_all),
          value: "sprintpoker://#{store.game[:id]}"
      end
    end
  end
end
