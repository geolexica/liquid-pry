# (c) Copyright 2020 Ribose Inc.
#

module Jekyll
  module Pry
    # Interrupts rendering, allowing user to inspect or modify the context.
    #
    # @example
    #   {% pry %}
    class Tag < Liquid::Tag
      def initialize(tag_name, text, tokens)
        super
      end

      def render(context)
        binding.pry
        ""
      end
    end
  end
end

Liquid::Template.register_tag("pry", Jekyll::Pry::Tag)
