module Operations
  module Game
    def set_game_name(value)
      @game[:name] = value
    end

    def set_game_deck_id(value)
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
        create_game
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

    def next_ticket_id
      @game[:tickets].detect { |k,v| break v[:id] if v[:points] == nil}
    end

    def start_game
      change_current_ticket_id(next_ticket_id)
      render!
    end

    def state_voting?
      @state[:name] == 'voting'
    end

    def state_review?
      @state[:name] == 'review'
    end
  end
end
