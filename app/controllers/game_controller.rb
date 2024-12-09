class GameController < ApplicationController
  protect_from_forgery with: :null_session # Handle JSON requests

  # This would normally be stored in the database or dynamically generated
  CORRECT_POSITION = { x: 250, y: 141 }.freeze # Adjust as per your image dimensions
  TOLERANCE = 50 # Acceptable distance from the correct position

  def submit
    user_x = params[:x].to_f
    user_y = params[:y].to_f

    # Calculate distance from the correct point
    distance = Math.sqrt((CORRECT_POSITION[:x] - user_x)**2 + (CORRECT_POSITION[:y] - user_y)**2)
    puts "Distance: #{distance}"

    if distance <= TOLERANCE
      render json: { message: 'Correct! You clicked the right spot.' }
    else
      render json: { message: 'Incorrect! Try again.' }
    end
  end
end
