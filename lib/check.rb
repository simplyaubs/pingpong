require 'forwardable'

class Check
  extend Forwardable

  attr_accessor :name
  attr_accessor :url
  attr_accessor :frequency
  attr_accessor :method
  attr_accessor :data

  attr_accessor :custom_properties

  def initialize(options)
    self.name = options[:name]
    self.url = options[:url]
    self.frequency = options[:frequency]
    self.method = (options[:method] || "GET").upcase
    self.data = options[:data]

    self.custom_properties = options[:custom]

    raise "Check 'name' is required." unless self.name
    raise "Check 'url' is required." unless self.url
    raise "Check 'frequency' is required." unless self.frequency
    raise "Check 'method' must be one of POST or GET." unless ["POST", "GET"].include? self.method
    raise "Check 'data' is required for POST method." if self.method == "POST" && self.data == nil
  end

  def to_hash
    { :name => self.name,
      :url => self.url,
      :frequency => self.frequency,
      :method => self.method,
      :data => self.data,
      :custom => self.custom_properties }
  end
end
