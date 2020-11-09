require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @word       = params[:word].upcase
    @letters    = params[:letters].split
    @result     = included?(@word, @letters)
    @translated = get_translation(@word)
  end

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def get_translation(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read.to_s)
    json['found']
  end
end

#  generate random letters
#  store them in to an array
#  show them in to view new
#  prompt user to choose a word

#  params and check if is a word
#  show the result to the use
#  if the name is english
#  if
