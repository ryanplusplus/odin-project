require 'sinatra'
require 'sinatra/reloader' if development?
require './Game'

enable :sessions

get '/' do
  erb :index
end

post '/new' do
  Game.create session
  redirect '/game'
end

post '/guess' do
  Game.guess session, params['guess']
  redirect '/lost' if Game.lost? session
  redirect '/won' if Game.won? session
  redirect '/game'
end

get '/game' do
  erb :game, :locals => {
    current: Game.current(session),
    remaining_guesses: Game.remaining_guesses(session),
    guesses: Game.guesses(session)
  }
end

get '/won' do
  erb :won, :locals => {word: Game.word(session)}
end

get '/lost' do
  erb :lost, :locals => {word: Game.word(session)}
end
