module Operations
  module Game
    def set_game_name(value)
      @game[:name] = value
    end

    def set_deck_game_id(value)
      @game[:deck][:id] = value
    end

    def validate_game_name
      @errors[:game_name] = nil
      @errors[:game_name] = 'required' if !@game[:name] || @game[:name].strip.empty?
      @errors[:game_name] = 'too long' if @game[:name] && @game[:name].length > 100
      render!
    end

    def game_name_valid?
      @errors[:game_name] == nil
    end

    def new_game
      validate_user_name
      validate_game_name
      if game_name_valid?
        @channel.push('game:create', @game)
        @in_game = true
      end
      render!
    end

    def join_game
      validate_user_name
      if game_name_valid? && user_name_valid?
        @in_game = true
        connect_to_game
      end
      render!
    end
  end
end
