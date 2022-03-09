require_relative './UI/display.rb'
require_relative './GameSetup/user.rb'
require_relative './GameSetup/game.rb'

class TicTacToe 

   tic_tac_toe = TicTacToe.new
   display = Display.new
   user = UserName.new
   game = Game.new
   current_player = user.current_player
   score_board = display.score_board
   game_running = true
   
   # Human player first move. Displays the board, takes and adds selection and removes from remaining places array
   # Need to add error handling for invalid move for human player
   
   remaining_places = game.remaining_places
   
   display.display_board
   while game_running do
      
      
      # First Round
      user.current_player = user.players[0]
      user_input = game.get_user_input(user, remaining_places)
   
      display.update_score_board(user, user_input)
      display.display_board
      game.update_remaining_places(remaining_places, user_input)
      if game.check_winner?(score_board, current_player)
         game_running = false
         break
      end
        
      #AI player move
      user.current_player = user.players[1]
      random_selection = game.ai_move_selection(game.remaining_places)
      display.update_score_board(user, random_selection)
      display.display_board
      game.update_remaining_places(remaining_places, random_selection)
   end
   puts "#{user.current_player} wins!"

   # if game.remaining_places.length == 0
   #    puts "It's a draw!"
   # else
   # end
end













