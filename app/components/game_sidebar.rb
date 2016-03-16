class GameSidebar
  include Inesita::Component

  def render
    form do
      div class: 'form-group' do
        label { 'Session name:' }
        input class: 'form-control',
          disabled: true,
          value: store.game[:name]
      end
      div class: 'form-group' do
        label { 'Session link:' }
        input class: 'form-control',
          disabled: true,
          value: "http://sprintpoker.io/games/#{store.game[:id]}"
      end
      ul class: 'form-group' do
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

          end
        end
      end
    end
  end
end
