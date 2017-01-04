require "json"

struct JSON::Any
  def initialize(raw : Int32)
    @raw = raw.to_i64
  end

  def initialize(raw : Float32)
    @raw = raw.to_f64
  end

  def initialize(raw : Time)
    @raw = raw.to_json
  end

  def as_t?
    begin
      as_t
    rescue
      nil
    end
  end

  def as_t
    Time.from_json(@raw.as(String))
  end
end

module Liquid
  alias Any = JSON::Any
end
