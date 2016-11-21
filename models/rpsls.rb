require('pry-byebug')
require_relative('../db/sqler')

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
    result = ""
    case player_choice
    when "rock"
      case computer_choice
      when "rock"
        winner = winners[2]
      when "paper"
        result = outcomes[:paper][0]
        winner = winners[1]
      when "scissors"
        result = outcomes[:rock][1]
        winner = winners[0]
      when "lizard"
        result = outcomes[:rock][0]
        winner = winners[1]
      when "spock"
        result = outcomes[:spock][1]
        winner = winners[1]
      end
    when "paper"
      case computer_choice
      when "rock"
        result = outcomes[:paper][0]
        winner = winners[0]
      when "paper"
        winner = winners[2]
      when "scissors"
        result = outcomes[:scissors][0]
        winner = winners[1]
      when "lizard"
        result = outcomes[:lizard][0]
        winner = winners[1]
      when "spock"
        result = outcomes[:paper][1]
        winner = winners[0]
      end
    when "scissors"
      case computer_choice
      when "rock"
        result = outcomes[:rock][1]
        winner = winners[1]
      when "paper"
        result = outcomes[:scissors][0]
        winner = winners[0]
      when "scissors"
        winner = winners[2]
      when "lizard"
        result = outcomes[:scissors][1]
        winner = winners[0]
      when "spock"
        result = outcomes[:spock][0]
        winner = winners[1]
      end
    when "lizard"
      case computer_choice
      when "rock"
        result = outcomes[:rock][0]
        winner = winners[1]
      when "paper"
        result = outcomes[:lizard][0]
        winner = winners[0]
      when "scissors"
        result = outcomes[:scissors][1]
        winner = winners[1]
      when "lizard"
        winner = winners[2]
      when "spock"
        result = outcomes[:lizard][1]
        winner = winners[0]
      end
    when "spock"
      case computer_choice
      when "rock"
        result = outcomes[:spock][1]
        winner = winners[0]
      when "paper"
        result = outcomes[:paper][1]
        winner = winners[1]
      when "scissors"
        result = outcomes[:spock][0]
        winner = winners[0]
      when "lizard"
        result = outcomes[:lizard][1]
        winner = winners[1]
      when "spock"
        winner = winners[2]
      end
    end
    self.save(player_choice, computer_choice, winners, winner)
    return ["You chose #{player_choice.capitalize}...", "The computer chose #{computer_choice.capitalize}...", "#{result} #{winner}"]
  end

  def self.save(player_choice, computer_choice, winners, winner)
    case winner
    when winners[0]
      winlog = "player"
    when winners[1]
      winlog = "computer"
    when winners[2]
      winlog = "draw"
    end

    sql = "
    INSERT INTO log
    (player_choice, computer_choice, winner)
    VALUES
    ('#{player_choice}', '#{computer_choice}', '#{winlog}')
    ;"
    SqlEr.run(sql)
  end

  def self.publish_log
    sql = "
    SELECT * FROM log
    ;"
    result = SqlEr.run(sql)
    log = []
    result.each do |item|
      log << item
    end
    log.reverse!
    return log
  end

end
