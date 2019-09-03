# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.f

puts 'Cleaning database motherfuckers'

Laboratory.destroy_all
Vaccine.destroy_all


puts 'Creating Laboratory db...'

Laboratory.create(name: 'Centro de Imunização Pro Matre Paulista', address: 'Rua Cincinato Braga, 37 - 2 Andar - Bela Vista, São Paulo - SP, 01333-011', phone: '(11) 3287-5000', opening_hours: 'segunda a sexta, das 08h às 18h', website: 'http://vacinapromatre.com.br/', category: 'private')
Laboratory.create(name: 'Vacina Descomplicada', address: 'Rua José Antônio Coelho, 801 - Vila Mariana, São Paulo - SP, 04011-062', phone: '(11) 5579-9090', opening_hours: 'segunda a sexta, das 08:30h às 18h', website: 'vacinadescomplicada.com.br', category: 'private')
Laboratory.create(name: 'CEDIPI Clínica', address: 'Alameda Joaquim Eugênio de Lima, 1338 - Jardim Paulista, São Paulo - SP, 01403-002', phone: '(11) 3887-6111', opening_hours: 'segunda a sexta, das 08h às 18h', website: 'cedipi.com.br', category: 'private')
Laboratory.create(name: 'UBS Nossa Senhora do Brasil - Armando Darienzo', address: 'Rua Almirante Marques Leão, 648 - Bela Vista, São Paulo - SP, 01330-010', phone: '(11) 3284-4601', opening_hours: 'segunda a sexta, das 07h às 19h', website: 'https://www.prefeitura.sp.gov.br/cidade/secretarias/saude/', category: 'public')


puts 'Finished!'

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'vaccines.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Vaccine.new
  t.name = row['name']
  t.vaccination_age = row['vaccination_age']
  t.doses = row['doses']
  t.lab = row['lab']
  t.sus = row['sus']
  t.required = row['required']
  t.description = row['description']
  t.save
  puts "#{t.name} saved"
end

puts "There are now #{Vaccine.count} rows in the transactions table"

