# frozen_string_literal: true

require_relative 'view/2d'
require_relative 'model/state'

view = View::Ruby2DView.new
initial_state = Model.initial_state
view.render(initial_state)
