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

end

##rake db:drop db:create db:migrate db:seed utils:generate_admins
