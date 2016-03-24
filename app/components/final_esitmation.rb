class FinalEstimation
  include Inesita::Component

  def render
    div id: 'final-estimation', class: 'clearfix' do
      div class: 'img' do
        img src: '/static/final.png'
      end
      span class: 'label' do
        'Final estimation:'
      end
      div class: 'value' do
        if store.user_admin?
          select class: 'form-control' do
            store.game[:deck][:cards].each do |card|
              option { card }
            end
          end
        else
          span do
            '???'
          end
        end
      end
    end
  end
end
