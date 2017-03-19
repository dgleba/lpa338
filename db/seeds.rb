# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
 r1 = Role.create({name: "sc_admin", description: "Can perform any CRUD operation on any resource"})
 r2 = Role.create({name: "sc_minimal", description: ""})
 r3 = Role.create({name: "sc_readonly", description: ""})
 r4 = Role.create({name: "sc_create", description: ""})
 r5 = Role.create({name: "sc_regular", description: "Can edit data, readonly lookup tables"})
 r6 = Role.create({name: "sc_supervisor", description: "Can edit lookup tables"})
 r7 = Role.create({name: "sc_delete", description: ""})
 r8 = Role.create({name: "sc_vip", description: ""})
 r9 = Role.create({name: "sc_special1", description: ""})
r10 = Role.create({name: "sc_seller", description: ""})

#
  User.create! email: 'a@e', name: 'admin' , password: 'a', password_confirmation: 'a', role_id: r1.id
  User.create! email: 'a', name: 'admin' , password: 'a', password_confirmation: 'a', role_id: r1.id
#
   u1 = User.create({name: "reg", email: "r", password: "a", password_confirmation: "a", role_id: r5.id})
   u2 = User.create({name: "miniml", email: "m", password: "a", password_confirmation: "a", role_id: r2.id})
#   u3 = User.create({name: "sKev", email: "k@e", password: "a", password_confirmation: "a", role_id: r2.id})
#   u4 = User.create({name: "admin", email: "a", password: "a", password_confirmation: "a", role_id: r3.id})



