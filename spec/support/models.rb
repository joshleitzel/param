class Model < ActiveRecord::Base
  self.abstract_class = true

  def to_s
    'string'
  end
end

class Order < Model
  param :number, to_s: true
end

class Product < Model
  param :sku
end

class User < Model
  def to_s
    "#{first_name} #{last_name}"
  end
end
