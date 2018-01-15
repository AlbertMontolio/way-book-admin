# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "albert.montolio@waygroup.de", password: "albert.montolio@waygroup.de")

divisions = ["WAY Engineering GmbH", "WAY People+ GmbH", "WAY HR Professionals & Experts GmbH", "WAY IT Solutions GmbH"]

divisions.each do |division_name|
	Division.create(name: division_name)
end