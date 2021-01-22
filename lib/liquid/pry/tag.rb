# (c) Copyright 2020 Ribose Inc.
#

module Liquid
  module Pry
    # Interrupts rendering, allowing user to inspect or modify the context.
    #
    # @example
    #   {% pry %}
    class Tag < Liquid::Tag
      attr_reader :once
      attr_reader :visited

      def initialize(tag_name, text, tokens)
        super
        @visited = false
        parse_args(text)
      end

      def parse_args(args_str)
        case args_str.strip
        when ""
          return
        when "once"
          set_once
        else
          raise(
            ArgumentError,
            "Arguments passed to pry tag could not be recognized: #{args_str}",
          )
        end
      end

      def set_once
        @once = true
      end

      def render(context)
        binding.pry unless once && visited
        @visited = true
        ""
      end
    end
  end
end

Liquid::Template.register_tag("pry", Liquid::Pry::Tag)
