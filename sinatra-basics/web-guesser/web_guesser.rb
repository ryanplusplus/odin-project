require 'sinatra'
require 'sinatra/reloader'

class Game
  MAX_GUESSES = 5

  def initialize
    reset
  end

  def guess guess
    @guesses += 1

    if guess == @secret then
      message = "You got it! The secret number was #{@secret}\n\nGuess to play again"
      reset
      return message, 0
    elsif @guesses > MAX_GUESSES then
      reset
      return "Nope! Too many guesses, try again", 0
    elsif guess > @secret then
      return "Too high! Guess again", guess - @secret
    else
      return "Too low! Guess again", @secret - guess
    end
  end

  def starting_prompt
    "Guess a number 0-100"
  end

  def secret
    @secret
  end

  private

  def reset
    @secret = rand 101
    @guesses = 0
  end
end

game = Game.new

get '/' do
  guess = params["guess"]
  cheat = params["cheat"]

  if guess then
    message, delta = game.guess guess.to_i
  else
    message = game.starting_prompt
  end

  erb :index, :locals => {message: message, delta: delta, secret: game.secret, cheat: cheat == 'true'}
end
