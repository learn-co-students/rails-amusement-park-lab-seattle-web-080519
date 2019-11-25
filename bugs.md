
DEPRECATION WARNING: Leaving `ActiveRecord::ConnectionAdapters::SQLite3Adapter.represent_boolean_as_integer`
set to false is deprecated. SQLite databases have used 't' and 'f' to serialize
boolean values and must have old data converted to 1 and 0 (its native boolean
serialization) before setting this flag to true. Conversion can be accomplished
by setting up a rake task which runs

  ExampleModel.where("boolean_column = 't'").update_all(boolean_column: 1)
  ExampleModel.where("boolean_column = 'f'").update_all(boolean_column: 0)

for all models and all boolean columns, after which the flag must be set to
true by adding the following to your application.rb file:

  Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true
 (called from <top (required)> at /Users/gregorymorgan/Desktop/Code/My_Code/rails-amusement-park-lab-seattle-web-080519/spec/rails_helper.rb:32)



  9) Feature Test: Go on a Ride when the user doesn't have enough tickets, clicking on 'Go on ride' displays a sorry message
     Failure/Error: expect(page).to have_content("You do not have enough tickets the #{@ferriswheel.name}")
       expected to find text "You do not have enough tickets the Ferris Wheel" in "Toggle navigation Home Amy Poehler's profile LogOut Sorry. You do not have enough tickets to ride the Ferris Wheel. Show a User Name: Amy Poehler Height: 58 Tickets: 1 Happiness: 3 Mood: happy Nausea: 2 ADMIN: false See attractions Log Out"
     # ./spec/features/users_features_spec.rb:251:in `block (2 levels) in <top (required)>'

  10) Feature Test: Go on a Ride when the user is too short and doesn't have enough tickets, clicking on 'Go on ride' displays a detailed sorry message
      Failure/Error: expect(page).to have_content("You do not have enough tickets the #{@rollercoaster.name}")
        expected to find text "You do not have enough tickets the Roller Coaster" in "Toggle navigation Home Amy Poehler's profile LogOut Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster. Show a User Name: Amy Poehler Height: 30 Tickets: 1 Happiness: 3 Mood: happy Nausea: 2 ADMIN: false See attractions Log Out"
      # ./spec/features/users_features_spec.rb:262:in `block (2 levels) in <top (required)>'

  11) Ride has a method 'take_ride' that accounts for the user not having enough tickets
      Failure/Error: expect(ride.take_ride).to eq("Sorry. You do not have enough tickets the #{attraction.name}.")
      
        expected: "Sorry. You do not have enough tickets the Roller Coaster."
             got: "Sorry. You do not have enough tickets to ride the Roller Coaster."
      
        (compared using ==)
      # ./spec/models/ride_spec.rb:43:in `block (2 levels) in <main>'

  12) Ride has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets
      Failure/Error: expect(ride.take_ride).to eq("Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}.")
      
        expected: "Sorry. You do not have enough tickets the Roller Coaster. You are not tall enough to ride the Roller Coaster."
             got: "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
      
        (compared using ==)
      # ./spec/models/ride_spec.rb:61:in `block (2 levels) in <main>'

Finished in 2.13 seconds (files took 0.87089 seconds to load)
62 examples, 12 failures
