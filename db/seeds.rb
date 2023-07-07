# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Data is from Denver's first round of municipal elections: 
# https://denvergov.org/electionresults#/results/20230404

Candidate.destroy_all
Election.destroy_all

# ELECTIONS

mayor = Election.create!(name: "Denver Mayor", priority: 1, year: 2023, runoff: false)

auditor = Election.create!(name: "Auditor", priority: 2, year: 2023, runoff: false)
clerk = Election.create!(name: "Clerk and Recorder", priority: 2, year: 2023, runoff: false)

council_at_large = Election.create!(name: "City Council: At-Large", priority: 3, year: 2023, runoff: false)

council_d1 = Election.create!(name: "City Council: District 1", priority: 4, year: 2023, runoff: false)
council_d2 = Election.create!(name: "City Council: District 2", priority: 4, year: 2023, runoff: false)
council_d3 = Election.create!(name: "City Council: District 3", priority: 4, year: 2023, runoff: false)

# CANDIDATES

mayor.candidates.create!(name: "Mike Johnston", votes: 42273, incumbent: false)
mayor.candidates.create!(name: "Kelly Brough", votes: 34627, incumbent: false)
mayor.candidates.create!(name: "Lisa Calderón", votes: 31493, incumbent: false)
mayor.candidates.create!(name: "Andy Rougeot", votes: 19927, incumbent: false)
mayor.candidates.create!(name: "Leslie Herod", votes: 18506, incumbent: false)

auditor.candidates.create!(name: "Timothy M. O'Brien", votes: 84856, incumbent: true)
auditor.candidates.create!(name: "Erik J. Clarke", votes: 58657, incumbent: false)

clerk.candidates.create!(name: "Paul D. López", votes: 128772, incumbent: true)

council_at_large.candidates.create!(name: "Serena Gonzales-Gutierrez", votes: 52971, incumbent: false)
council_at_large.candidates.create!(name: "Sarah Parady", votes: 42725, incumbent: false)
council_at_large.candidates.create!(name: "Penfield Tate", votes: 40109, incumbent: false)
council_at_large.candidates.create!(name: "Travis Leiker", votes: 38799, incumbent: false)

council_d1.candidates.create!(name: "Ava Truckey", votes: 2993, incumbent: false)
council_d1.candidates.create!(name: "Amanda Sandoval", votes: 13625, incumbent: true)

council_d2.candidates.create!(name: "Kevin Flynn", votes: 8792, incumbent: true)
council_d2.candidates.create!(name: "Tiffany Caudill", votes: 2215, incumbent: false)
council_d2.candidates.create!(name: "Chris Herr", votes: 1237, incumbent: false)

council_d3.candidates.create!(name: "Jamie Torres", votes: 1237, incumbent: true)




