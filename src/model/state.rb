# frozen_string_literal: true

module Model
  module Direction
    UP = :up
    RIGHT = :right
    DOWN = :down
    LEFT = :left
  end

  Coord = Struct.new(:row, :col)

  class Food < Coord
  end

  Snake = Struct.new(:positions)

  Grid = Struct.new(:rows, :cols)

  State = Struct.new(:snake, :food, :grid, :curr_direction, :game_finished)

  def self.initial_state
    Model::State.new(
      Model::Snake.new([
                         Model::Coord.new(1, 1),
                         Model::Coord.new(0, 1)
                       ]),
      Model::Food.new(4, 4),
      Model::Grid.new(8, 12),
      Direction::DOWN,
      false
    )
  end
end
