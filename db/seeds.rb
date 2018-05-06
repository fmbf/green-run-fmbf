# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#


User.create(username: "bobby_tables", password: "tables")

20.times do
  User.create(username: Faker::Name.first_name, password: "password")
end

# -------------- Breweries -------------- #
nhb = Brewery.create(name: "Northern Hemisphere Brewco")
shb = Brewery.create(name: "Southern Hemisphere Brewco")
nab = Brewery.create(name: "North American Brewco")
ob = Brewery.create(name: "Oceanic Brewco")

# -------------- Beers -------------- #
ahool = Beer.create(
  name: "Ahool Ale",
  brewery: nhb,
  actively_brewed: true,
  ibu: 33,
  abv: 5.4,
  flavors: "biscuity",
  last_tapped_on: "1/23/2016"
)

agogwe = Beer.create(
  name: "Agogwe Ale",
  brewery: shb,
  actively_brewed: true,
  ibu: 28,
  abv: 2.9,
  flavors: "wheat, floral",
  last_tapped_on: "5/18/2016"
)

aswang = Beer.create(
  name: "Aswang Ale",
  brewery: nhb,
  actively_brewed: true,
  ibu: 31,
  abv: 4.2,
  flavors: "butter, yeast",
  last_tapped_on: "2/13/2016"
)

buru = Beer.create(
  name: "Buru's Barley Wine",
  brewery: nhb,
  actively_brewed: true,
  ibu: 76,
  abv: 11.1,
  flavors: "raisin, dried fruit, bourbon",
  last_tapped_on: "1/1/2016"
)

hyote = Beer.create(
  name: "Hyote Chocolate Stout",
  brewery: nab,
  actively_brewed: true,
  ibu: 78,
  abv: 7.4,
  flavors: "caramel, chocolate",
  last_tapped_on: "1/7/2016"
)

igopogo = Beer.create(
  name: "Igopogo Pilsner",
  brewery: nab,
  actively_brewed: true,
  ibu: 36,
  abv: 5.7,
  flavors: "malt, bread",
  last_tapped_on: "11/15/2015"
)

jackalobe = Beer.create(
  name: "Jackalobe Lager",
  brewery: nab,
  actively_brewed: true,
  ibu: 29,
  abv: 3.3,
  flavors: "fruit, citrus",
  last_tapped_on: "3/15/2016"
)

mahamba = Beer.create(
  name: "Mahamba Barley Wine",
  brewery: shb,
  actively_brewed: true,
  ibu: 57,
  abv: 9.7,
  flavors: "malt, raisin",
  last_tapped_on: "4/24/2016"
)

megalodon = Beer.create(
  name: "Megalodon Pale Ale",
  brewery: ob,
  actively_brewed: true,
  ibu: 99,
  abv: 5.7,
  flavors: "bread, hops, pine",
  last_tapped_on: "3/31/2016"
)

pope = Beer.create(
  name: "Pope Lick Porter",
  brewery: nab,
  actively_brewed: true,
  ibu: 39,
  abv: 6.5,
  flavors: "smokey, chocolate, banana",
  last_tapped_on: "1/6/2016"
)

Beer.create(
  name: "Chocolate Pukwudgie Stout",
  actively_brewed: true,
  ibu: 35,
  abv: 12.2,
  flavors: "chocolate, coffee",
  last_tapped_on: "2/25/2016",
  brewery: nab
)

Beer.create(
  name: "Sharlie Pilsner",
  actively_brewed: true,
  ibu: 31,
  abv: 4.1,
  flavors: "grass",
  last_tapped_on: "2/18/2016",
  brewery: nab
)

Beer.create(
  name: "Sigbin Stout",
  actively_brewed: false,
  ibu: 65,
  abv: 8.1,
  flavors: "coffee, caramel",
  last_tapped_on: "3/18/2016",
  brewery: nab
)

Beer.create(
  name: "Snallygaster Pale Ale",
  actively_brewed: false,
  ibu: 89,
  abv: 9.7,
  flavors: "pine, honey",
  last_tapped_on: "4/29/2016",
  brewery: nab
)

Beer.create(
  name: "Tikibalang Barley Wine",
  actively_brewed: true,
  ibu: 45,
  abv: 9.6,
  flavors: "bourbon",
  last_tapped_on: "3/14/2016",
  brewery: nab
)

Beer.create(
  name: "Pale Popobawa Ale",
  actively_brewed: true,
  ibu: 30,
  abv: 4.4,
  flavors: "wheat",
  last_tapped_on: "5/9/2016",
  brewery: shb
)

Beer.create(
  name: "North Adjule Lager",
  actively_brewed: true,
  ibu: 30,
  abv: 3.7,
  flavors: "citrus",
  last_tapped_on: "2/8/2016",
  brewery: shb
)

# -------------- Comments -------------- #
Beer.all.each do |beer|
  3.times do
    Comment.create(
      user: User.all.sample,
      beer: beer,
      body: Faker::HowIMetYourMother.catch_phrase,
    )
  end
end
