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

  def self.initial_state
    Model::State.new(
      Model::Snake.new([
                         Model::Coord.new(1, 1),
                         Model::Coord.new(0, 1)
                       ]),
      Model::Food.new(4, 4),
      Model::Grid.new(8, 12)
    )
  end
end
