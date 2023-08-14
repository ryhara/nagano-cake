# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: "test@mail",
    password: "123456"
)

Genre.create!(
    name: "ケーキ"    
)

Genre.create!(
    name: "プリン"
)

Genre.create!(
    name: "焼き菓子"
)


Genre.create!(
    name: "キャンディ"
)

Item.create!(
    genre_id: 1,
    name: "モンブラン",
    description: "国産栗を使用しています",
    non_taxed_price: 500,
    is_selling: true
)

Item.create!(
    genre_id: 1,
    name: "ショートケーキ",
    description: "人気No.1ケーキ",
    non_taxed_price: 480,
    is_selling: true
)

Item.create!(
    genre_id: 2,
    name: "卵たっぷり濃厚プリン",
    description: "国産卵使用",
    non_taxed_price: 500,
    is_selling: true
)

Item.create!(
    genre_id: 3,
    name: "マカロンセット（8個）" ,
    description: "8個入り！手土産におすすめ",
    non_taxed_price: 1200,
    is_selling: true
)

Item.create!(
    genre_id: 4,
    name: "カラフルキャンディ",
    description: "色とりどりのカラフルキャンディ",
    non_taxed_price: 300,
    is_selling: true
)