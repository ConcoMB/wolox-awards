# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# encoding: utf-8


conco = User.create!(admin:true, email: 'cmaderblanco@wolox.com.ar', password: 'password', password_confirmation: 'password', name: "Conco")
fagus = User.create!(admin:true, email: 'agustina.fainguersch@wolox.com.ar', password: 'password', password_confirmation: 'password', name: "fabus")
gabo = User.create!(admin:true, email: 'gabriel.zanzotti@wolox.com.ar', password: 'password', password_confirmation: 'password', name: "gabo")

wcapo = Category.create!(name: 'W capo', description: 'el mas capo', is_open: true)
random = Category.create!(name: 'W random', description: 'el mas random', is_open: true, random: true)
wsecreto = Category.create!(name: 'W sorpresa', description: 'el mas sorpresa', is_open: false)

Voter.create!(category: wsecreto, user: conco)
Voter.create!(category: wsecreto, user: gabo)
Voter.create!(category: wsecreto, user: fagus)

Nominee.create!(category: wsecreto, user: conco)
Nominee.create!(category: wsecreto, user: gabo)

Nominee.create!(category: wcapo, user: conco)
Nominee.create!(category: wcapo, user: gabo)

Nominee.create!(category: random, user: conco)
Nominee.create!(category: random, user: gabo)
