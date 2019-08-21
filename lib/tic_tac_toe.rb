require 'pry'

class TicTacToe
  attr_accessor :board, :user, :index, :turn, :turn_count



  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,4,6],
    [2,5,8],

  ]
  def display_board
    # board.each do |board, index|
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n"
      puts "-----------\n"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} \n"
      puts "-----------\n"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
    # end

  end




  def input_to_index(user)
    input = user.to_i
    @index = input - 1

    # @input_to_index = input_to_index(user)

  end


  def initialize
    @board = Array.new(9, " ")
    self

    # self.board = board
    WIN_COMBINATIONS

  end

  def move(index, token = "X")
    @board[index] = token

  end

  def position_taken?(index)
    self.board[index] != " "
  end

  def valid_move?(user)
    @user == (1..9)
    @board[user] == " "
  end


  def turn_count

    @board.count("X").to_i + @board.count("O").to_i
    @turn_count = @board.count("X").to_i + @board.count("O").to_i

  end

  def current_player
    # @turn_count

    if turn_count.even?
      return "X"
      puts "It's Team X's turn\n Enter 1-9..."
    else
      return "O"
      puts "It's Team O's turn\n Enter 1-9..."
    end

  end

  def turn

    puts "Please enter a number between 1 - 9... "
    user = gets.chomp.to_i
    @index = input_to_index(user)

    if valid_move?(@index)
      @token = current_player
      move(@index, @token)

    else
      turn
      # puts "Not a valid move. Please enter a number between 1 - 9..."
      # user = gets.chomp.to_i
      # @index = input_to_index(user)

    end
    display_board
    turn_count


  end

end
