# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'destroy database'

Category.delete_all
Product.delete_all
Variant.delete_all

puts 'creating categories'

cocina {
individuales
manteles
caminos
platos
fuentes y ensaladeras
}

fragancias hogar {
  difusores
  aguas de hogar
  piedras aromaticas

}
indumentaria {
  pijamas
  camisas y tops
  calzado
  vestidos

}
manos y cuerpo {
  jabones
  gel de baño
  aceite de baño
  espuma de baño
  perfume y colonia

}
decoracion {

ALfombras
canastos
}
