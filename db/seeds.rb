# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
puts 'destroy database'
LineItem.delete_all
Variant.delete_all
Product.delete_all
Category.delete_all


Division.delete_all

puts 'creating divisions'
cocina = Division.create(title: 'Cocina', photo: 'https://images.unsplash.com/photo-1556912167-f556f1f39fdf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1960&q=80')
fragancias = Division.create(title: 'Fragancias de hogar',photo: 'https://images.unsplash.com/photo-1505691938895-1758d7feb511?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80')
ropa = Division.create(title: 'Indumentaria', photo: 'https://images.unsplash.com/photo-1499939667766-4afceb292d05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1952&q=80')
jabon = Division.create(title: 'Manos y cuerpos', photo: 'https://images.unsplash.com/photo-1474625121024-7595bfbc57ac?ixlib=rb-1.2.1&auto=format&fit=crop&w=1955&q=80')
decoracion = Division.create(title: 'Decoracion', photo: 'https://images.unsplash.com/photo-1503652601-557d07733ddc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80')

puts 'creating categories'

individuales = Category.create(title: 'Individuales', division: cocina)
manteles = Category.create(title: 'Manteles', division: cocina)
caminos = Category.create(title: 'Caminos', division: cocina)
platos = Category.create(title: 'Platos', division: cocina)
fuentes = Category.create(title: 'Fuentes y Ensaladeras', division: cocina)

difusores = Category.create(title: 'Difusores', division: fragancias )
aguas = Category.create(title: 'Aguas de Hogar', division: fragancias )
piedras = Category.create(title: 'Piedras Aromaticas', division: fragancias )


pijamas = Category.create(title: 'Pijamas', division: ropa )
camisas = Category.create(title: 'Camisas y Tops', division: ropa )
calzado = Category.create(title: 'Calzado', division: ropa )
vestidos = Category.create(title: 'Vestidos', division: ropa )


jabones = Category.create(title: 'Jabones', division: jabon )
gel = Category.create(title: 'Gel de Baño', division: jabon )
aceite = Category.create(title: 'Aceite de Baño', division: jabon )
espuma = Category.create(title: ' Espuma de baño', division: jabon )
perfume = Category.create(title: 'Perfume & Colonia', division: jabon )

alfombras = Category.create(title: 'Alfombras', division: decoracion )
canastos = Category.create(title: 'Canastos', division: decoracion )

'creating products'

photos = ['https://images.unsplash.com/photo-1566491888763-e71518bbe846?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1534&q=80',
 'https://images.unsplash.com/photo-1554141186-996eb6b1a09d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1578&q=80',
 'https://images.unsplash.com/photo-1565183928294-7063f23ce0f8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'
]

category = Category.all
title = ['Leona Placemat',
  'Leona Plato',
  'Pijama de ultima generacion',
  'Vestido elegante']
file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')

  2.times do
   g = Product.new(title: title.sample ,description: 'HOla como andas todo bien y vos', category: category.sample, price: 30)
   g.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
   g.save!

 end

 puts 'finish database seed'















