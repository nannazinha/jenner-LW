puts 'Cleaning database motherfuckers'

Laboratory.destroy_all
Vaccine.destroy_all
User.destroy_all
Member.destroy_all
LaboratoryVaccine.destroy_all


puts 'Creating Laboratory db...'

Laboratory.create(name: 'Centro de Imunização Pro Matre Paulista', address: 'Rua Cincinato Braga, 37, Bela Vista, São Paulo, SP', phone: '(11) 3287-5000', website: 'http://vacinapromatre.com.br/', category: 'private', opening_time: 8, closing_time: 18)
Laboratory.create(name: 'Vacina Descomplicada', address: 'Rua José Antônio Coelho, 801, Vila Mariana, São Paulo, SP', phone: '(11) 5579-9090', website: 'vacinadescomplicada.com.br', category: 'private', opening_time: 8, closing_time: 18)
Laboratory.create(name: 'CEDIPI Clínica', address: 'Alameda Joaquim Eugênio de Lima, 1338, Jardim Paulista, São Paulo, SP', phone: '(11) 3887-6111', website: 'cedipi.com.br', category: 'private', opening_time: 8, closing_time: 18)
Laboratory.create(name: 'UBS Nossa Senhora do Brasil - Armando Darienzo', address: 'Rua Almirante Marques de Leão, 648, Bela Vista, São Paulo, SP', phone: '(11) 3284-4601', website: 'https://www.prefeitura.sp.gov.br/cidade/secretarias/saude/', category: 'public', opening_time: 7, closing_time: 9)
Laboratory.create(name: 'Fleury - Unidade Alameda Jaú', address: 'Alameda Jaú, 1725, Jardim Paulista, São Paulo, SP', phone: '(11) 3179-0822', website: 'http://www.fleury.com.br', category: 'private', opening_time: 6, closing_time: 12)
Laboratory.create(name: 'VACCIN', address: 'Rua Itacolomi, 333, Higienópolis, São Paulo, SP', phone: '(11) 3231-4249', website: 'http://www.vaccin.com.br/', category: 'private', opening_time: 9, closing_time: 19)
Laboratory.create(name: 'UBS Pinheiros', address: 'Rua Ferreira de Araújo, 789, Pinheiros, São Paulo, SP', phone: '(11) 3031-7763', website: 'https://www.prefeitura.sp.gov.br/cidade/secretarias/saude/', category: 'public', opening_time: 7, closing_time: 19)
Laboratory.create(name: 'UBS Parque da Lapa', address: 'Rua Bergson, 52, Vila Leopoldina, São Paulo, SP', phone: '(11) 3836-8029', website: 'https://www.prefeitura.sp.gov.br/cidade/secretarias/saude/', category: 'public', opening_time: 7, closing_time: 19)
Laboratory.create(name: 'UBS Dr. Manoel Joaquim Pera', address: 'Rua Purpurina, 280, Vila Madalena, São Paulo, SP', phone: '(11) 3032-9891', website: 'https://www.prefeitura.sp.gov.br/cidade/secretarias/saude/', category: 'public', opening_time: 7, closing_time: 19)
Laboratory.create(name: 'Vacinare - Centro de Vacinação', address: 'Rua Pio XI, 697, Alto da Lapa, São Paulo, SP', phone: '(11) 3641-4813', website: 'https://www.vacinare.com.br/', category: 'private', opening_time: 8, closing_time: 18)
Laboratory.create(name: 'Imunovita Vacinas', address: 'Rua Deputado Lacerda Franco, 300, Pinheiros, São Paulo, SP', phone: '(11) 3813-7070', website: 'http://www.imunovita.com.br/', category: 'private', opening_time: 8, closing_time: 18)
Laboratory.create(name: 'UBS Alto de Pinheiros', address: 'Avenida Queiroz Filho, 313, Centro, São Paulo, SP', phone: '(11) 3022-7074', website: 'https://www.prefeitura.sp.gov.br/cidade/secretarias/saude/', category: 'public', opening_time: 7, closing_time: 19)
Laboratory.create(name: 'UBS Max Perlman', address: 'Rua Jaques Félix, 499, Vila Nova Conceição, São Paulo, SP', phone: '(11) 3842-5146', website: 'https://www.prefeitura.sp.gov.br/cidade/secretarias/saude/', category: 'public', opening_time: 7, closing_time: 17)
Laboratory.create(name: 'Vacinarte - Clínica de Vacinação', address: 'Rua Tanabi, 248, Barra Funda, São Paulo, SP', phone: '(11) 3868-2242', website: 'https://www.vacinarte.com.br', category: 'private', opening_time: 9, closing_time: 18)
Laboratory.create(name: 'Centro de Vacinação Faria Lima', address: 'Avenida Brigadeiro Faria Lima, 2013, Pinheiros, São Paulo, SP', phone: '(11) 3815-8703', website: 'https://vacinacaofarialima.com.br/', category: 'private', opening_time: 9, closing_time: 18)

puts "#{Laboratory.count} laboratories created!!!"

puts 'Creating vaccines db...'

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

puts "#{Vaccine.count} vaccines added to db!!!"

puts 'Creating Laboratory vaccine prices...'

num_labs = Laboratory.count + 1
num_vacs = Vaccine.count + 1

num_labs.times do |l|
  num_vacs.times do |v|
    LaboratoryVaccine.create(
      laboratory_id: l,
      vaccine_id: v,
      price: (rand(100..600)/100)
    )
  end
end

puts "#{LaboratoryVaccine.count} laboratory vaccines created!!!"

puts 'Finished!'
