# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Param do
  it 'has a version number' do
    expect(Param::VERSION).not_to be nil
  end

  describe '#to_param' do
    context 'when attribute is nil' do
      it 'is nil' do
        expect(Order.new.to_param).to be_nil
      end
    end

    context 'when attribute is not nil' do
      it 'is the attribute' do
        expect(Order.new(number: 'O1234').to_param).to eq('O1234')
      end
    end

    context 'when no :param has been defined' do
      it 'is the ID string (super)' do
        expect(User.create.to_param).to eq('1')
      end
    end
  end

  describe '#to_s' do
    context 'when :to_s option has been set' do
      it 'uses the param' do
        order = Order.create(number: 'O1234')
        expect(order.to_s).to eq('O1234')
      end
    end

    context 'when :to_s has not been set and #to_s is not overridden' do
      it 'uses the inherited method' do
        product = Product.create(sku: '1234')
        expect(product.to_s).to eq('string')
      end
    end

    context 'when :to_s has not been set and #to_s is overridden' do
      it 'uses the regular method' do
        user = User.create(first_name: 'Jane', last_name: 'Doe')
        expect(user.to_s).to eq('Jane Doe')
      end
    end
  end

  describe '.from_param' do
    context 'when value is nil' do
      it 'is nil' do
        expect(Order.from_param(nil)).to be_nil
      end
    end

    context 'when value is not nil' do
      it 'is the record with the attribute set to the value' do
        order = Order.create(number: 'O9876')
        expect(Order.from_param('O9876')).to eq(order)
      end
    end

    context 'when no :param has been defined' do
      it 'is the record with ID set to the value' do
        user = User.create
        expect(User.from_param(user.id)).to eq(user)
      end
    end
  end
end
