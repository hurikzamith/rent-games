puts "starting seed..."

puts "cleaning db..."
Board.destroy_all

puts "creating boards..."

10.times do
  Board.create(
    title: ,
    category: ,
    rating: ,
    price: ,
    player_number:
  )
end

puts "#{Board.count} boards created!"
