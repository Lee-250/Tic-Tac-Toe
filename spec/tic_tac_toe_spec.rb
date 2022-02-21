require_relative '../tic_tac_toe.rb'
require_relative '../GameSetup/user.rb'
require_relative '../UI/display.rb'
require 'stringio'

describe UserName do
    it 'username initialises as "Not defined"' do
        user_name = described_class.new
        expect(user_name.name).to eq('Not defined')
    end
    
    describe 'Update user' do
        it 'Can receive user input and change user name' do
            $stdin = StringIO.new('Lee')
            user_name = UserName.new
            
            expect{user_name.change_user_name(user_name)}. to output("Name: \n").to_stdout.and change {user_name.name}.to('Lee')
        end
    end
end

describe Display do
    describe 'display_board' do
        it 'Can display a 3 x 3 grid in the terminal' do
            tic_tac_toe = described_class.new
            score_board = tic_tac_toe.score_board
            expect{tic_tac_toe.display_board}.to output(" #{score_board[0]} " "|" " #{score_board[1]} " "|" " #{score_board[2]} \n" "-----------\n" " #{score_board[3]} " "|" " #{score_board[4]} " "|" " #{score_board[5]} \n" "-----------\n" " #{score_board[6]} " "|" " #{score_board[7]} " "|" " #{score_board[8]} \n").to_stdout
        end
        describe 'score_board' do 
            it 'Can return an array with 9 empty strings' do
                tic_tac_toe = described_class.new
            
                expect(tic_tac_toe.score_board).to eq ([' ', ' ', ' ',
            ' ', ' ', ' ',
            ' ', ' ', ' '])
            end
        end
        describe 'update_score' do
            it 'Updates the score array with chosen index' do
                tic_tac_toe = described_class.new
                expect(tic_tac_toe.update_score_board(0)). to eq(['X', ' ', ' ',
                ' ', ' ', ' ',
                ' ', ' ', ' '])
            end
        end
end

describe TicTacToe do
    describe 'get_user_input' do 
        it 'Prompts the user to select their move' do
            tic_tac_toe = described_class.new
            user_name = UserName.new
        
            expect{tic_tac_toe.get_user_input(user_name)}.to output("#{user_name.name}: Make your move\n").to_stdout
        end
        it 'Returns user input' do
            tic_tac_toe = described_class.new
            user_name = UserName.new
            $stdin = StringIO.new('1')

            expect(tic_tac_toe.get_user_input(user_name)).to eq ('1')
        end
    end    

        
    describe 'input_to_index' do
        it 'converts user input string to integer' do
                tic_tac_toe = described_class.new
                # $stdin = StringIO.new('1')
                expect(tic_tac_toe.input_to_index('1')). to eq(0)
        end
        
    end
    
    
    end
    

    

end

        # it 'Updates score board with user input' do
        #     tic_tac_toe = described_class.new
        #     user_name = UserName.new
        #     $stdin = StringIO.new('1')

        #     expect{}. to output("#{user_name.name}: Make your move\n").to_stdout.and change {user_name.name}.to('Lee')
        # end



  # Can return an array of 9 empty strings
  # Can display empty grid to the terminal

  # Can take user input an populate one string in the array
  # Display updated grid with player 1's input

  # describe 'update_score' do 
        #     # it 'Updates score board array with user input' do
        #     #     tic_tac_toe = described_class.new
        #     #     user_name = UserName.new
        #     #     $stdin = StringIO.new('1')
        #     #     expect(tic_tac_toe.score_board[0]). to eq('X')
        #     # end
        # end