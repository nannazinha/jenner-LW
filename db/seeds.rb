puts 'Cleaning database motherfuckers'

Laboratory.destroy_all
Vaccine.destroy_all
User.destroy_all
Member.destroy_all

puts 'Creating users...'

User.create(email: 'mae@mail.com', password: '123456')
User.create(email: 'pai@mail.com', password: '123456')

puts 'Finished!'

puts 'Creating members'

Member.create(first_name: 'Mae', last_name: 'da Silva', birth_date: '01/01/1990', category: 'Titular', user_id: 1, gender: 'Male')
Member.create(first_name: 'Filho', last_name: 'da Silva', birth_date: '01/01/1990', category: 'Dependente', user_id: 1, gender: 'Male')

puts 'Creating Laboratory db...'

Laboratory.create(name: 'Centro de Imunização Pro Matre Paulista', address: 'Rua Cincinato Braga, 37, Bela Vista, São Paulo, SP', phone: '(11) 3287-5000', website: 'http://vacinapromatre.com.br/', category: 'private', opening_time: 8, closing_time: 18)
Laboratory.create(name: 'Vacina Descomplicada', address: 'Rua José Antônio Coelho, 801, Vila Mariana, São Paulo, SP', phone: '(11) 5579-9090', website: 'vacinadescomplicada.com.br', category: 'private', opening_time: 8, closing_time: 18)
Laboratory.create(name: 'CEDIPI Clínica', address: 'Alameda Joaquim Eugênio de Lima, 1338, Jardim Paulista, São Paulo, SP', phone: '(11) 3887-6111', website: 'cedipi.com.br', category: 'private', opening_time: 8, closing_time: 18)
Laboratory.create(name: 'UBS Nossa Senhora do Brasil - Armando Darienzo', address: 'Rua Almirante Marques de Leão, 648, Bela Vista, São Paulo, SP', phone: '(11) 3284-4601', website: 'https://www.prefeitura.sp.gov.br/cidade/secretarias/saude/', category: 'public', opening_time: 7, closing_time: 9)



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

