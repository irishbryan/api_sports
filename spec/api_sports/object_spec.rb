# frozen_string_literal: true

RSpec.describe Object do
  it "correctly creates object from hash" do
    obj = ApiSports::Object.new(foo: "bar")
    expect(obj.foo).to eq("bar")
  end

  it "correctly handles number" do
    obj = ApiSports::Object.new({ foo: { bar: 1 } })
    expect(obj.foo.bar).to eq(1)
  end

  it "correctly handles nested hash" do
    obj = ApiSports::Object.new(foo: { bar: { baz: "foobar" } })
    expect(obj.foo.bar.baz).to eq("foobar")
  end

  it "correctly handles array" do
    obj = ApiSports::Object.new(foo: [{ bar: :baz }])
    expect(obj.foo.first.class).to eq(OpenStruct)
    expect(obj.foo.first.bar).to eq(:baz)
  end
end
