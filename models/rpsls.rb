require('pry-byebug')

class RPSLS
  def self.game(player_choice)
    player_choice.downcase!
    options = ["rock", "paper", "scissors", "lizard", "spock"]
    computer_choice = options[rand(0..4)]
    unless options.include? player_choice
      return ["ERROR!", "ERROR!", "ERROR!"]
    end

    outcomes = {
      rock: ["Rock crushes Lizard!", "Rock crushes Scissors!"],
      paper: ["Paper covers Rock!", "Paper disproves Spock!"],
      scissors: ["Scissors cut Paper!", "Scissors decapitate Lizard!"],
      spock: ["Spock smashes Scissors!", "Spock vaporizes Rock!"],
      lizard: ["Lizard eats Paper!", "Lizard poisons Spock!"]
    }
    winners = ["You win!", "Computer wins!", "That's a draw!"]

    case player_choice
    when "rock"
      case computer_choice
      when "rock"
        result = "#{winners[2]}"
      when "paper"
        result = "#{outcomes[:paper][0]} #{winners[1]}"
      when "scissors"
        result = "#{outcomes[:rock][1]} #{winners[0]}"
      when "lizard"
        result = "#{outcomes[:rock][0]} #{winners[0]}"
      when "spock"
        result = "#{outcomes[:spock][1]} #{winners[1]}"
      end
    when "paper"
      case computer_choice
      when "rock"
        result = "#{outcomes[:paper][0]} #{winners[0]}"
      when "paper"
        result = "#{winners[2]}"
      when "scissors"
        result = "#{outcomes[:scissors][0]} #{winners[1]}"
      when "lizard"
        result = "#{outcomes[:lizard][0]} #{winners[1]}"
      when "spock"
        result = "#{outcomes[:paper][1]} #{winners[0]}"
      end
    when "scissors"
      case computer_choice
      when "rock"
        result = "#{outcomes[:rock][1]} #{winners[1]}"
      when "paper"
        result = "#{outcomes[:scissors][0]} #{winners[0]}"
      when "scissors"
        result = "#{winners[2]}"
      when "lizard"
        result = "#{outcomes[:scissors][1]} #{winners[0]}"
      when "spock"
        result = "#{outcomes[:spock][0]} #{winners[1]}"
      end
    when "lizard"
      case computer_choice
      when "rock"
        result = "#{outcomes[:rock][0]} #{winners[1]}"
      when "paper"
        result = "#{outcomes[:lizard][0]} #{winners[0]}"
      when "scissors"
        result = "#{outcomes[:scissors][1]} #{winners[1]}"
      when "lizard"
        result = "#{winners[2]}"
      when "spock"
        result = "#{outcomes[:lizard][1]} #{winners[0]}"
      end
    when "spock"
      case computer_choice
      when "rock"
        result = "#{outcomes[:spock][1]} #{winners[0]}"
      when "paper"
        result = "#{outcomes[:paper][1]} #{winners[1]}"
      when "scissors"
        result = "#{outcomes[:spock][0]} #{winners[0]}"
      when "lizard"
        result = "#{outcomes[:lizard][1]} #{winners[1]}"
      when "spock"
        result = "#{winners[2]}"
      end
    end

    return ["You chose #{player_choice.capitalize}...", "The computer chose #{computer_choice.capitalize}...", result]
  end

end
