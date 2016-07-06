class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  attr_accessor :word,:guesses,:wrong_guesses,:word_with_guesses,:check_win_or_lose
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    @word_with_guesses = @word.gsub(/./, '-')
    @check_win_or_lose = :play
    # @start_count = 0
  end
  

  def guess letter
      
      throw ArgumentError if letter.nil? || letter.empty?  || letter !~ /[a-zA-Z]/
      
      letter.downcase!
      
      return false if @guesses == letter || @wrong_guesses == letter 
     
      if @word.include? letter
        
        @guesses << letter
        
        guess_serveral_letters letter
        
        @check_win_or_lose = :win unless @word_with_guesses.include?('-')
      else
        # @start_count += 1
        @wrong_guesses << letter 
        @check_win_or_lose = :lose if @wrong_guesses.length == 7
        
      end
      
     true
  end
  
  def guess_serveral_letters letter
   
    match_indexes = (0...word.length).find_all { |i| word[i] == letter }
    match_indexes.each { |i| @word_with_guesses[i] = letter }
        
  end


  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end


