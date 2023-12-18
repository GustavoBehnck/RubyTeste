# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Coin.create!(
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/1200px-Bitcoin.svg.png"
)

Coin.create!(
    description: "Ethereum",
    acronym: "ETH",
    url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Ethereum-icon-purple.svg/512px-Ethereum-icon-purple.svg.png?20200227011040"
)

Coin.create!(
    description: "Dash",
    acronym: "DASH",
    url_image: "https://cdn2.iconfinder.com/data/icons/bitcoin-73/128/dash-512.png"
)