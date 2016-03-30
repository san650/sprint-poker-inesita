class UserName
  include Inesita::Component

  def change_user_name(e)
    store.set_user_name(e.target.value)
  end

  def validate_user_name(e)
    store.validate_user_name
  end

  def render
    div class: "col-md-6 form-group #{'has-error' if store.errors[:user_name]}" do
      label { 'Your name:' }

      span class: 'error' do
        store.errors[:user_name]
      end if store.errors[:user_name]

      input class: 'form-control',
        value: store.user[:name],
        onchange: method(:change_user_name),
        onblur: method(:validate_user_name)
    end
  end
end
