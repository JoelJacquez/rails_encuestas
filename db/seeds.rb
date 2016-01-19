# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(email: 'joel.jacquez@gmail.com', uid: '123nu214ij3n4', provider:'facebook')
poll = MyPoll.create(title: 'Cual es el mejor lenguaje de programacion',
                      description: 'Queremos sabes cual es el mejor lenguaje de programacion',
                      expires_at: DateTime.now + 1.year,
                      user: user)

question = Question.create(description: 'Te importa la eficiencia de ejecucion del programa?',
                            my_poll: poll)

answer = Answer.create(description: 'a) Si me importa mucho', question:question)
