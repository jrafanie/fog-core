require "spec_helper"

describe Fog::URI do
  it "#build raises on array" do
    assert_raises(ArgumentError) { Fog::URI.build([]) }
  end

  it "#build 127.0.0.1" do
    uri = Fog::URI.build(:scheme => "http", :path => "/test", :host => "127.0.0.1")
    assert_equal "http://127.0.0.1/test", uri.to_s
  end

  it "#build localhost" do
    uri = Fog::URI.build(:scheme => "http", :path => "/test", :host => "localhost")
    assert_equal "http://localhost/test", uri.to_s
  end

  it "#build ::1" do
    uri = Fog::URI.build(:scheme => "http", :path => "/test", :host => "::1", :port => 80)
    assert_equal "::1",   uri.hostname # Socket connections
    assert_equal "[::1]", uri.host     # URI components, Host request header field
    assert_equal "http://[::1]:80/test", uri.to_s
  end
end
