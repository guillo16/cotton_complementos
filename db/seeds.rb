# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
puts 'destroy database'
Order.delete_all
LineItem.delete_all
Cart.delete_all
Variant.delete_all
Product.delete_all
Category.delete_all
Division.delete_all
User.delete_all

puts 'creating divisions'
cocina = Division.create(title: 'Cocina', photo: 'https://res.cloudinary.com/san-patricio/image/upload/v1587416599/6de81824-e0c6-4663-b1aa-f791350fae12_iwrdqr.jpg')
fragancias = Division.create(title: 'Fragancias de hogar',photo: 'https://images.unsplash.com/photo-1503652601-557d07733ddc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80')
ropa = Division.create(title: 'Indumentaria', photo: 'https://res.cloudinary.com/san-patricio/image/upload/v1587416600/eaa9f16c-c382-491a-af89-c32e26fae21a_dchkf9.jpg')
jabon = Division.create(title: 'Manos y cuerpos', photo: 'https://images.unsplash.com/photo-1554372562-ffdf99cba1e8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1587&q=80')
decoracion = Division.create(title: 'Decoracion', photo: 'https://res.cloudinary.com/san-patricio/image/upload/v1587416941/IMG_E576DA07AB8E-1_vkevit.jpg')

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


 puts 'finish database seed'















