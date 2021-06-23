# frozen_string_literal: true

require 'ruby2d'
require_relative '../model/state'

module View
  class Ruby2dView
    def initialize(app)
      @pixel_size = 50
      @app = app
    end

    def start(state)
      extend Ruby2D::DSL
      set(
        title: 'Snake',
        width: @pixel_size * state.grid.cols,
        height: @pixel_size * state.grid.rows
      )
      on :key_down do |event|
        handle_key_event(event)
      end
      show
    end

    def render(state)
      extend Ruby2D::DSL
      close if state.game_finished
      render_food(state)
      render_snake(state)
    end

    private

    def render_food(state)
      @food&.remove
      extend Ruby2D::DSL
      food = state.food
      @food = Square.new(
        x: food.col * @pixel_size,
        y: food.row * @pixel_size,
        size: @pixel_size,
        color: 'yellow'
      )
    end

    def render_snake(state)
      @snake_positions&.each(&:remove)
      extend Ruby2D::DSL
      snake = state.snake
      @snake_positions = snake.positions.map do |pos|
        Square.new(
          x: pos.col * @pixel_size,
          y: pos.row * @pixel_size,
          size: @pixel_size,
          color: 'green'
        )
      end
    end

    def handle_key_event(event)
      case event.key
      when 'k', 'up'
        @app.send_action(:change_direction, Model::Direction::UP)
      when 'j', 'down'
        @app.send_action(:change_direction, Model::Direction::DOWN)
      when 'h', 'left'
        @app.send_action(:change_direction, Model::Direction::LEFT)
      when 'l', 'right'
        @app.send_action(:change_direction, Model::Direction::RIGHT)
      end
    end
  end
end
