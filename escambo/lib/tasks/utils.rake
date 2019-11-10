namespace :utils do
  desc "Cria Administradores fake"
  task :generate_admins => :environment do

  puts "Cadastrando Administradores Fakers..."

    10.times do
      Admin.create(email: Faker::Internet.email,
                   password: "123456",
                   password_confirmation: "123456")
    end

  puts "Cadastrando Administradores Fakers...[OK]"
  end

end
