# (c) Copyright 2020 Ribose Inc.
#

module Helpers
  def render_template(template_string, data = {})
    template = Liquid::Template.parse(template_string)
    template.render(data)
  end
end

RSpec.configure do |config|
  config.include Helpers
end
