Treatment.destroy_all
Appointment.destroy_all
Pet.destroy_all
Owner.destroy_all
Vet.destroy_all

o1 = Owner.create(first_name: "Pepito", last_name: "Perez", email: "pepitoperez@mail.com", phone: "13579", address: "Manuel Montt 123")
o2 = Owner.create(first_name: "Cristobal", last_name: "Colon", email: "cristobalcolon@mail.com", phone: "24680", address: "Conquistador de América 1492")
o3 = Owner.create(first_name: "Miguel", last_name: "Cervantes", email: "miguelcervantes@mail.com", phone: "12345", address: "La Mancha 1010")

p1 = o1.pets.create(name: "Firulais", species: "Dog", breed: "Quiltro", date_of_birth: "2020-02-20", weight: 15.5)
p2 = o1.pets.create(name: "Michi", species: "Cat", breed: "Persa", date_of_birth: "2024-04-24", weight: 4.2)
p3 = o2.pets.create(name: "Zanahoria", species: "Rabbit", breed: "Cabeza de León", date_of_birth: "2022-02-22", weight: 1.8)
p4 = o3.pets.create(name: "Bimbo", species: "Dog", breed: "Pastor Alemán", date_of_birth: "2019-09-19", weight: 30.0)
p5 = o3.pets.create(name: "Garfield", species: "Cat", breed: "Exótico de Pelo Corto", date_of_birth: "2008-08-18", weight: 3.5)

begin
  p1.photo.attach(io: File.open(Rails.root.join('db/seeds/pets/dog.jpg')), filename: 'dog.jpg', content_type: 'image/jpeg')
  p2.photo.attach(io: File.open(Rails.root.join('db/seeds/pets/cat.jpg')), filename: 'cat.jpg', content_type: 'image/jpeg')
  p3.photo.attach(io: File.open(Rails.root.join('db/seeds/pets/bird.jpg')), filename: 'bird.jpg', content_type: 'image/jpeg')
rescue Errno::ENOENT
  puts "No se encontraron las imágenes en db/seeds/pets/."
end

v1 = Vet.create(first_name: "Maria", last_name: "Correa", email: "maria.correa.vet@clinic.com", specialization: "Cirugía")
v2 = Vet.create(first_name: "Sebastian", last_name: "Ruiz", email: "sebastian.ruiz.vet@clinic.com", specialization: "Medicina General")

a1 = Appointment.create!(pet: p1, vet: v1, date: DateTime.now - 2.days, reason: "Cirugía", status: :completed)
a2 = Appointment.create!(pet: p2, vet: v2, date: DateTime.now - 1.day, reason: "Chequeo", status: :completed)
a3 = Appointment.create!(pet: p3, vet: v2, date: DateTime.now + 1.day, reason: "Vacuna", status: :scheduled)
a4 = Appointment.create!(pet: p4, vet: v1, date: DateTime.now, reason: "Herida", status: :in_progress)
a5 = Appointment.create!(pet: p5, vet: v2, date: DateTime.now - 5.days, reason: "Control", status: :cancelled)

a1.treatments.create(name: "Anestesia", medication: "Propofol", dosage: "5mg", notes: "Sin complicaciones", administered_at: a1.date)
a1.treatments.create(name: "Sutura", medication: "N/A", dosage: "N/A", notes: "Puntos internos", administered_at: a1.date + 1.hour)
a2.treatments.create(name: "Desparasitación", medication: "Totalne", dosage: "1 ml", notes: "Vía oral", administered_at: a2.date)
a4.treatments.create(name: "Limpieza", medication: "Suero", dosage: "100ml", notes: "Limpieza de escombros", administered_at: a4.date)
a4.treatments.create(name: "Antibiótico", medication: "Amoxicilina", dosage: "250mg", notes: "Primera dosis", administered_at: a4.date + 10.minutes)

puts "Base de datos generada para vets (lab5)"