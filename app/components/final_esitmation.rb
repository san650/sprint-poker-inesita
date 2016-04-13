class FinalEstimation
  include Inesita::Component

  def final_esimation(e)
     store.change_ticket_points(store.state[:current_ticket_id], e.target.value)
  end

  def render
    div class: 'final-estimation' do
      img src: '/static/hourglass.png'
      if store.user_admin?
        h4 { 'Pick final estimation:' }
        select class: 'form-control',
          onchange: method(:final_esimation) do
          option { "" }
          store.game[:deck][:cards].each do |card|
            option { card }
          end
        end
      else
        h4 { 'Right now administrator is reviewing points and picking final estimation.' }
      end
    end
  end
end
