# frozen_string_literal: true
ActiveRecord::Schema.define do
  self.verbose = false

  create_table :orders, force: true do |t|
    t.string :number
    t.timestamps
  end

  create_table :products, force: true do |t|
    t.string :sku
    t.timestamps
  end

  create_table :users, force: true do |t|
    t.string :first_name
    t.string :last_name
    t.timestamps
  end
end
