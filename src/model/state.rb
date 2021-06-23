# frozen_string_literal: true

# This file represent the state of the game

module Model
  Coord = Struct.new(:row, :col)

  class Food < Coord
  end

  class Snake < Stuct.new(:positions)
  end

  class Grid < Stuct.new(:rows, :cols)
  end

  State = Struct.new(:sanke, :food, :grid)
end
