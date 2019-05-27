require 'sinatra'
if development? require 'sinatra/reloader'

def caesar_cipher plaintext, shift
  ciphertext_chars = plaintext.chars.map do |c|
    if c >= 'a' and c <= 'z' then
      ascii = c.ord + shift
      ascii -= 26 if ascii.chr > 'z'
      ascii.chr
    elsif c >= 'A' and c <= 'Z' then
      ascii = c.ord + shift
      ascii -= 26 if ascii.chr > 'Z'
      ascii.chr
    else
      c
    end
  end

  ciphertext_chars.join
end

get '/' do
  plaintext = params['plaintext']
  shift = params['shift']
  ciphertext = plaintext ? caesar_cipher(plaintext, shift.to_i) : ''
  erb :index, :locals => {ciphertext: ciphertext}
end
