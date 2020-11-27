module Jekyll
  module Pry
    # +pry+ filter hooks Pry into filter chain in a Liquid template.  User can
    # inspect or modify filter input and rendering context via convenient
    # +input+ and +context+ local variables.
    #
    # The filter returns its input, hence it can be placed anywhere in the
    # filter chain, not necessarily at the end.  If user alters the +input+
    # variable, then modified version is returned.
    #
    # @example
    #   Today is {{ site.time | pry | date_to_string }}
    module Filter
      # @param input filter input
      def pry(input)
        context = @context
        binding.pry
        input
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::Pry::Filter)
