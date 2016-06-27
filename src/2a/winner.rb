# http://codeforces.com/problemset/problem/2/A

Round = Struct.new(:player, :score)

class WinnerCalculator
  def self.get_winner(scoreboard)
    rounds = []
    scoreboard.each do |round_line|
      player, score = round_line.split
      rounds << Round.new(player, score.to_i)
    end

    scoring = Hash.new(0)
    rounds.each do |round|
      scoring[round.player] += round.score
    end
    max_score = scoring.values.max
    players_with_max_score = scoring.select { |player, score| score == max_score }

    if players_with_max_score.size == 1
      return players_with_max_score.keys.first
    end

    tiebreak_scoring = Hash.new(0)
    rounds.each do |round|
      tiebreak_scoring[round.player] += round.score
      if tiebreak_scoring[round.player] >= max_score && scoring[round.player] == max_score
        return round.player
      end
    end
  end
end

if __FILE__ == $0
  scoreboard = []
  gets.to_i.times { scoreboard << gets }
  winner = WinnerCalculator.get_winner(scoreboard)
  puts winner
end
