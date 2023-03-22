# frozen_string_literal: true

RSpec.describe Object do
  it "handles hash" do
    obj = ApiSports::Object.new(foo: "bar")
    expect(obj.foo).to eq("bar")
  end

  it "handles primitive value" do
    obj = ApiSports::Object.new({ foo: { bar: 1 } })
    expect(obj.foo.bar).to eq(1)
  end

  it "handles nested hash" do
    obj = ApiSports::Object.new(foo: { bar: { baz: "foobar" } })
    expect(obj.foo.bar.baz).to eq("foobar")
  end

  it "handles array of hashes" do
    obj = ApiSports::Object.new(foo: [{ bar: :baz }])
    expect(obj.foo.first.class).to eq(OpenStruct)
    expect(obj.foo.first.bar).to eq(:baz)
  end
end
