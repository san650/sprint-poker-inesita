module Operations
  module User
    def set_user_name(value)
      @user[:name] = value || ""
    end

    def validate_user_name(what)
      @errors[:user_name] = nil
      @errors[:user_name] = 'required' if !@user[:name] || @user[:name].strip.empty?
      @errors[:user_name] = 'too long' if @user[:name] && @user[:name].length > 100
      update_user
      render!
    end

    def user_name_valid?(what)
      @errors[:user_name] == nil
    end
  end
end
