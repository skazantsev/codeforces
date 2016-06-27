require_relative 'winner.rb'
require 'test/unit'

class WinnerCalculatorTests < Test::Unit::TestCase
  test 'example' do
    winner = WinnerCalculator.get_winner(['mike 3', 'andrew 5', 'mike 2'])
    assert_equal('andrew', winner)
  end

  test 'player who has max points wins' do
    winner = WinnerCalculator.get_winner(['andrew -1', 'mike 2', 'andrew 4'])
    assert_equal('andrew', winner)
  end

  test 'line breaks in input' do
    winner = WinnerCalculator.get_winner(["mike 3\n"])
    assert_equal('mike', winner)
  end

  test 'player who reaches max score first loses' do
    winner = WinnerCalculator.get_winner(['mike 3', 'mike -1', 'andrew 3'])
    assert_equal('andrew', winner)
  end

  test 'player who reaches max score first wins even after losing some points' do
    winner = WinnerCalculator.get_winner(['mike 3', 'mike -1', 'andrew 2'])
    assert_equal('mike', winner)
  end

  test 'player who reaches max score with overflow wins after losing some points' do
    winner = WinnerCalculator.get_winner(['mike 3', 'mike 2', 'andrew 4', 'mike -1'])
    assert_equal('mike', winner)
  end

  test 'player who reaches max score wins after comeback' do
    winner = WinnerCalculator.get_winner(['mike 3', 'mike -4', 'andrew 1', 'mike 2'])
    assert_equal('mike', winner)
  end

  test 'both players lost scores and wins one who scored first' do
    winner = WinnerCalculator.get_winner(['andrew 5', 'mike 6', 'andrew -2', 'mike -3'])
    assert_equal('andrew', winner)
  end
end
