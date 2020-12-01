# (c) Copyright 2020 Ribose Inc.
#

RSpec.describe "Pry tag" do
  before do
    allow(Pry).to receive(:start)
  end

  example "using in a template" do
    render_template(<<~LIQUID)
      {% pry %}
    LIQUID

    expect(Pry).to have_received(:start).once
  end

  example "using many times in a template" do
    render_template(<<~LIQUID, {"loop_iterations" => [1, 2, 3]})
      {% pry %} (1st call)
      {% pry %} (2nd call)

      {% for i in loop_iterations %}
        {% pry %} (another three calls)
      {% endfor %}
    LIQUID

    expect(Pry).to have_received(:start).exactly(5).times
  end
end
