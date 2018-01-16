# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "albert.montolio@waygroup.de", password: "albert.montolio@waygroup.de")

divisions = [
	{
		name: "WAY Engineering GmbH",
		teams: ["Brigitte Schulz", "Christian Sailer"],
		positions: ["SE-Team Leiter", "Modul Leiter", "Konstruktor", "Modulplanner"],
		skills: [
			{
				category: "SE-Team Leiter",
				category_skills: ["Boole Tool", "CAD-PDM", "Catia v5", "Freigabeleitstand", "Freigaben", "gAMS", "GSS", "ip3 Terminplan", "ItO Workplace", "KMG/MMG", "LOP", "PEP PDM", "PRISMA", "Projektbedarf", "SKYPE", "TWEN", "TAIS", "PRISMA", "CARISMA", "PQM", "Catia v6"]
			},
			{
				category: "Modul Leiter",
				category_skills: ["AKV", "Baukasten", "Dali & DBV", "DBKR", "Einkaufswagen", "ItO", "Lastenheft", "Lieferant", "Modularbeit", "PMC", "Problemmanagement", "Qualitätsmgmt - Six Sigma - 5W/8D Methode", "Reifegradmanagement", "SBWE", "Virtuelles Gesamtfahrzeug", "Catia v5", "Catia v6", "Prisma", "CAD-PDM", "M-gAMS", "Project Management"]
			},
			{
				category: "Programmierer",
				category_skills: ["Ruby", "Rails", "JavaScript", "HTML", "CSS", "Daten Banken", "Java", "Python", "R", "Visual Basic", "Android", "Swift", "iOS", "Linux", "Active Record", "MySql", "Node.js"]
			},
			{
				category: "Project Management",
				category_skills: ["Leadership", "Team Management", "RPlan", "Microsoft Office Project Management", "Konfliktmanagement", "PLM: Product-Lifecycle-Management"]
			},
			{
				category: "Business Developer",
				category_skills: ["Excel", "Market analyse", "Konkurrenz Analyse", "Visual Basic", "R", "Python", "PowerPoint", "Kunde Betreung", "Messe Erfahrung", "Workshops Vorbereitung"]
			},
			{
				category: "Konstruktor",
				category_skills: ["Catia v5", "Catia v6", "Automotive Erfahrung", "Bauteil Kenntnisse", "Zeichnungen", "Solid Works"]
			},
			{
				category: "Languages",
				category_skills: ["Deutsch", "Englisch", "Spanisch", "Polnisch", "Chinesisch"]
			},
			{
				category: "Karosserie Module",
				category_skills: ["KA: Bodengruppe", "KB: Rohbau, Seitengerippe, Dach", "KC: Dach-, Verdecksysteme, Einfüll-Ladeklappen", "KD: Frontsystem, Kunststoffexterieur, Stossfänger", "KE: Einstieg, Türsystem", "KF: Heckklappe, Front-, Heckscheibe, Reinigungssystem", "KG: Licht, Karosserieelektronik"]
			},
		]
	},
	{
		name: "WAY People+ GmbH",
		teams: ["People A", "People B"],
		positions: ["People Position A", "People Position B", "People Position C", "People Position D", "People Position E",],
		skills: [
			{
				category: "People Category A",
				category_skills: ["Skill A", "Skill B", "Skill C", "Skill D", "Skill E"]
			},
		]
	},
	{
		name: "WAY HR Professionals & Experts GmbH",
		teams: ["Pro Team A", "Pro Team B"],
		positions: ["Pro Pos A", "Pro Pos B", "Pro Pos C", "Pro Pos D"],
		skills: [
			{
				category: "Pro Category B",
				category_skills: ["Skill A", "Skill B", "Skill C", "Skill D", "Skill E"]
			},
		]
	},
	{
		name: "WAY IT Solutions GmbH",
		teams: ["Michael Dreisbach", "Team B"],
		positions: ["System Admin", "Internet Admin", "Servers Admin"],
		skills: [
			{
				category: "IT-Support",
				category_skills: ["Windows Clients 7/10", "Windows Server 2008", "Windows Server 2012", "Android", "iOS", "Microsoft Exchange", "Microsoft SQL", "Virtualisierung VMware", "Virtualisierung HyperV", "IPv4", "IPv6", "Firewalls", "DHCP", "DNS", "VLAN", "Internet-Domains", "DNS Verwaltung", "Email-Workflow", "Antispam"]
			},
		]
	},
]

# create divisions
divisions.each do |division|
	Division.create(name: division[:name])
end

# create categories
divisions.each do |division_hash|
	division_object = Division.where(name: division_hash[:name])[0]
	division_hash[:skills].each do |skill|
		category = Category.new(name: skill[:category])
		category.division = division_object
		category.save
	end
end

# create company_skill, for every category
divisions.each do |division_hash|
	division_hash[:skills].each do |skill|
		category = Category.where(name: skill[:category])[0]
		category_skills = skill[:category_skills]
		category_skills.each do |category_skill_name|
			company_skill = CompanySkill.new(name: category_skill_name)
			company_skill.category = category
			company_skill.save
		end
	end
end












