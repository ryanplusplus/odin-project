require 'literate_randomizer'

class Game
  def self.current state
    (state['word'].chars.map do |c|
      state['guesses'].include?(c) ? c : '_'
    end).join.capitalize
  end

  def self.create state
    state['word'] = LiterateRandomizer.word.downcase
    state['remaining_guesses'] = 7
    state['guesses'] = ''
  end

  def self.guess state, c
    if not state['guesses'].include? c then
      state['guesses'] += c

      if not state['word'].include? c then
        state['remaining_guesses'] -= 1
      end
    end
  end

  def self.won? state
    not self.current(state).include? '_'
  end

  def self.lost? state
    state['remaining_guesses'] <= 0
  end

  def self.word state
    state['word'].capitalize
  end

  def self.remaining_guesses state
    state['remaining_guesses']
  end

  def self.guesses state
    state['guesses'].chars
  end
end
