require 'velocity_handler'
ActionView::Template.register_template_handler(:vel, VelocityHandler)