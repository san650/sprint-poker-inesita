class UserName
  include Inesita::Component

  def render
    div class: "col-md-6 form-group #{'has-error' if store.errors[:user_name]}" do
      label { 'Your name:' }
      span class: 'error' do
        store.errors[:user_name]
      end if store.errors[:user_name]
      input class: 'form-control',
        value: store.user[:name],
        onchange: ->(e) { store.set(:user_name, e.target.value) },
        onblur: ->(e) { store.validate(:user_name) }
    end
  end
end
