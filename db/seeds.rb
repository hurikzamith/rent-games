require 'open-uri'
require 'json'

url_board = 'https://api.boardgameatlas.com/api/search?order_by=rank&ascending=false&pretty=true&client_id=JLBr5npPhV'
url_category = 'https://api.boardgameatlas.com/api/game/categories?pretty=true&client_id=JLBr5npPhV'

puts "Starting seed..."

puts "Cleaning db..."
User.destroy_all

puts 'Creating fake users...'

4.times do
  User.create!(
    first_name: Faker::Name.name,
    last_name: Faker::Name.first_name,
    email: Faker::Internet.email,
    address: Faker::Address.street_address,
    password: Faker::Internet.password
  )
end
puts "#{User.count} Users created!"

puts 'Open and parsing URLs...'

GAMES_URL = JSON.parse(URI.parse(url_board).open.read)

CATEGORY_URL = JSON.parse(URI.parse(url_category).open.read)['categories']

def find_category(category_id)
  category = CATEGORY_URL.find do |categ|
    categ['id'] == category_id
  end
  category['name']
end

def find_sample_board
  GAMES_URL['games'].sample
end

puts "Creating boards..."
User.all.each do |created_user|
  boards_per_user = rand(0..3)
  boards_per_user.times do |_number_board|
    sample_game = find_sample_board
    board = Board.new(
      title: sample_game['name'],
      category: find_category(sample_game['categories'].sample['id']),
      rating: rand(0..5),
      price: sample_game['price'],
      player_number: sample_game['players']
      # sample_game['thumb_url'] -> Imagem do game, fazer em cloudinary
    )
    board.user = created_user
    board.save!
  end
end
puts "Created #{Board.count} board games"
