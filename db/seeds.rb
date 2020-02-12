# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Devin', email_address: 'dk@gmail.com', password_digest: 'pass', has_aeropress: true, has_chemex: false, has_pourover: false )
User.create(name: 'Devin Cloud Kelly', email_address: 'devin.cloud.kelly@gmail.com', password_digest: BCrypt::Password.create('cloud'), has_aeropress: true, has_chemex: true, has_pourover: true )

Preparation.create(device: 'aeropress', coffee_brand: 'Intelligentsia', coffee_name: 'Red Eye', coffee_amount: 18, coffee_grind: 'medium-fine', total_water: 200, total_time: 105, notes: 'great tasting, easy aeropress cup', user_id: 1)
Preparation.create(device: 'aeropress', coffee_brand: 'Intelligentsia', coffee_name: 'Red Eye', coffee_amount: 20, coffee_grind: 'medium-fine', total_water: 250, total_time: 120, notes: 'okay', user_id: 1)
Preparation.create(device: 'aeropress', coffee_brand: 'Intelligentsia', coffee_name: 'Red Eye', coffee_amount: 17, coffee_grind: 'fine', total_water: 200, total_time: 90, notes: 'fantastic!', user_id: 1)

Step.create(action: 'bloom', duration: 15, amount: 40, order: 1, directions: 'pour 40ml of water over your grounds and stir for 10 seconds', preparation_id:1)
Step.create(action: 'wait', duration: 15, amount: 0, order: 2, directions: 'wait for another 15 seconds until the counter hits 00:30 seconds. Get the top of the aeropress ready for the next step', preparation_id:1)
Step.create(action: 'press', duration: 30, amount: 0, order: 3, directions: 'very slowly, over the next 30 seconds, press the coffee out of your aeropress. Slow press = sweeter coffee. Fast press = more bitter', preparation_id:1)
Step.create(action: 'pour water', duration: 30, amount: 160, order: 4, directions: 'Remove the aeropress from your cup and pour another 160ml of water into your cup. You should finish by the 1:45 mark', preparation_id:1)
Step.create(action: 'enjoy', duration: 00, amount: 0, order: 5, directions: 'Enjoy your cup of coffee', preparation_id:1)