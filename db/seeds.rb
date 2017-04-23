# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
list = [
  ["AK","Alaska","USA"],
  ["AS","American Samoa","USA"],
  ["AZ","Arizona","USA"],
  ["AR","Arkansas","USA"],
  ["CA","California","USA"],
  ["CO","Colorado","USA"],
  ["CT","Connecticut","USA"],
  ["DE","Delaware","USA"],
  ["DC","Dist. of Columbia","USA"],
  ["FL","Florida","USA"],
  ["GA","Georgia","USA"],
  ["GU","Guam","USA"],
  ["HI","Hawaii","USA"],
  ["ID","Idaho","USA"],
  ["IL","Illinois","USA"],
  ["IN","Indiana","USA"],
  ["IA","Iowa","USA"],
  ["KS","Kansas","USA"],
  ["KY","Kentucky","USA"],
  ["LA","Louisiana","USA"],
  ["ME","Maine","USA"],
  ["MD","Maryland","USA"],
  ["MA","Massachusetts","USA"],
  ["MI","Michigan","USA"],
  ["MN","Minnesota","USA"],
  ["MS","Mississippi","USA"],
  ["MO","Missouri","USA"],
  ["MT","Montana","USA"],
  ["NE","Nebraska","USA"],
  ["NV","Nevada","USA"],
  ["NH","New Hampshire","USA"],
  ["NJ","New Jersey","USA"],
  ["NM","New Mexico","USA"],
  ["NY","New York","USA"],
  ["NC","North Carolina","USA"],
  ["ND","North Dakota","USA"],
  ["OH","Ohio","USA"],
  ["OK","Oklahoma","USA"],
  ["OR","Oregon","USA"],
  ["PA","Pennsylvania","USA"],
  ["PR","Puerto Rico","USA"],
  ["RI","Rhode Island","USA"],
  ["SC","South Carolina","USA"],
  ["SD","South Dakota","USA"],
  ["TN","Tennessee","USA"],
  ["TX","Texas","USA"],
  ["UT","Utah","USA"],
  ["VT","Vermont","USA"],
  ["VI","Virgin Islands","USA"],
  ["VA","Virginia","USA"],
  ["WA","Washington","USA"],
  ["WV","West Virginia","USA"],
  ["WI","Wisconsin","USA"],
  ["WY","Wyoming","USA"]
]
list.each do |s|
  State.create(abbr: s[0], name: s[1], country: s[2])
end
