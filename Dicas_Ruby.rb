##Não compilável!!!
==========================> USO DE %W e %Q <===========================>
pry(main)> abc = {a: 123, b:456, c:789}
  => {:a=>123, :b=>456, :c=>789}
pry(main)> abc.except(:c)
  => {:a=>123, :b=>456}
pry(main)> abc
  => {:a=>123, :b=>456, :c=>789}
pry(main)> abc.except(:c, :b)
  => {:a=>123}
pry(main)> abc.except!(:c)
  => {:a=>123, :b=>456}
pry(main)> abc
  => {:a=>123, :b=>456}
pry(main)> abc = {a: 123, b:456, c:789}
  => {:a=>123, :b=>456, :c=>789}
pry(main)> abc.extract!(:c)
  => {:c=>789}
pry(main)> abc
  => {:a=>123, :b=>456}
pry(main)> x = 123
  => 123
pry(main)> s = "oi"
  => "oi"
pry(main)> s = "oi #{x}"
  => "oi 123"
pry(main)> s = 'oi #{x}'
  => "oi \#{x}"
pry(main)> s = %Q(oi #{x})
  => "oi 123"
pry(main)> s = %q(oi #{x})
  => "oi \#{x}"
pry(main)> s = %w(pedro pereira)
  => ["pedro", "pereira"]
pry(main)> s = %W(pedro pereira)
  => ["pedro", "pereira"]
pry(main)> s = %W(pedro pereira #{x})
  => ["pedro", "pereira", "123"]
pry(main)> s = %w(pedro pereira #{x})
  => ["pedro", "pereira", "\#{x}"]

==========================> USO DE Struct <===========================>

Development [1] escambo(main)> User = Struct.new(:name, :age, :email)
User < Struct
Development [2] escambo(main)> u1 = User.new("Pedro Aniceto", 24, "pedro@madri")
#<Struct:User:0x5589754a7758
    age = 24,
    email = "pedro@madri",
    name = "Pedro Aniceto"
>
Development [3] escambo(main)> u1.name
"Pedro Aniceto"

==========================> begin / rescue / ensure <===========================>
Exemplos:

def levantar_erro
  begin
    p ">>>>>>>>>>antes do erro"
    raise "erro de alguma coisa..."
    p "depois do erro"
  rescue Exception => e
    p "pode dar erro que eu continuo ...........ERRO QUE DEU: #{e}"
  end
end

levantar_erro

(Olhando um erro específico...)

def levantar_erro
  begin
    p ">>>>>>>>>>antes do erro"
    File.open("abc.txt")
    p "Depois do erro"
  rescue Errno::ENOENT
    p "O arquivo não existe..."
  rescue Exception => e
    p "pode dar erro que eu continuo ...........ERRO QUE DEU: #{e}"
  ensure
    p ">>>>>Isso é feito de qualquer forma!"
  end
end

levantar_erro

