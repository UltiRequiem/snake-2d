# frozen_string_literal: true

require 'ruby2d'

module View
  class Ruby2DView
    def initialize
      @pixel_size = 50
    end

    def render(state)
      extend Ruby2D::DSL
      set(
        title: 'Snake',
        width: @pixel_size * state.grid.cols,
        height: @pixel_size * state.grid.rows
      )
      show
    end
  end
end
