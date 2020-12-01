# (c) Copyright 2020 Ribose Inc.
#

RSpec.describe "Pry filter" do
  before do
    allow(Pry).to receive(:start)
  end

  example "using in a template" do
    render_template(<<~LIQUID, {"letter" => "a"})
      {{ letter | pry }}
    LIQUID

    expect(Pry).to have_received(:start).once
  end

  example "can be placed in the middle of a filter chain" do
    result = render_template(<<~LIQUID, {"letter" => "a"})
      {{ letter | append: 'b' | pry | append: 'c' }}
    LIQUID

    expect(Pry).to have_received(:start).once
    expect(result.strip).to eq("abc")
  end
end
