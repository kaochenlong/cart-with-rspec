# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    title { '商品名稱' }
    price { 100 }
    description { '商品描述' }
  end
end
