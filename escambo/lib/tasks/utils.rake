namespace :utils do
  desc "Cria Administradores fake"
  task :generate_admins => :environment do

  puts "Cadastrando Administradores Fakers..."

    10.times do
      Admin.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456",
        role: [0,0,1,1,1].sample)
    end

  puts "Cadastrando Administradores Fakers...[OK]"
  end

  ##############################################################

  desc "Cria Anúncios Fake"
  task :generate_ads => :environment do

  puts "Cadastrando Anúncios..."

  100.times do
    Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: LeroleroGenerator.paragraph(Random.rand(3)),
        member: Member.all.sample,
        category: Category.all.sample
      )
    end

    puts "Cadastrando Anúncios...[OK]"
  end

end

##rake db:drop db:create db:migrate db:seed utils:generate_admins
