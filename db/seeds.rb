# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: 'long@example.com', password: 's3cret!22', password_confirmation: 's3cret!22')
User.create(email: 'long.tran@example.com', password: 's3cret!22', password_confirmation: 's3cret!22')

Ac.create(serial_number: 'DAI123', registration_date: '2021-12-30', firmware_version: 'DAIA001')
Ac.create(serial_number: 'CSP123', registration_date: '2021-12-27', firmware_version: 'CSPA001')
