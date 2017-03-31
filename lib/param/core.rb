# frozen_string_literal: true
require 'active_record'

ActiveRecord::Base.class_eval do
  class << self
    def param(attribute, options = {})
      @param = attribute
      @param_to_s = options[:to_s]

      alias_method :to_s, :to_param if options[:to_s] == true
    end

    def param_name
      @param
    end

    attr_reader :param_to_s

    def from_param(value)
      if param_name.nil?
        find(value)
      else
        criteria = {}
        criteria[param_name] = value

        find_by(criteria)
      end
    end
  end

  def to_param
    if param_name.nil?
      super
    else
      send(param_name)
    end
  end

  private

  def param_name
    self.class.param_name
  end
end
