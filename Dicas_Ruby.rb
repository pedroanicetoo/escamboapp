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

==========================> Limit/Offset, Order, Excerpt, Truncate <===========================>
Client.limit(5) ##Lista os primeiros 5 clientes
Cliente.limit(5).offset(30)  ##Começa a partir do 10 e pega os 5 elementos 30-35
##Order
@categories = Category.order(:description) ##Ordenando um index pelo atributo :description
@categories = Category.order(description: :desc) # ordem descendente
##Excerpt
excerpt('This is an example', 'an', radius: 5) # evidencia paravra an e pega 5 caractereas a direita e esquerda da mesma
 => ...s is an exam...
#Trucate
truncate("Once upon a time in a world far far away", 14) #14 primeiros caracteres evidenciados
 => Once upon a...

==========================> system, backticks, %x, exec <===========================>
system "pwd"
/home/pedro/workspace/escamboapp/escambo
true
`pwd`
"/home/pedro/workspace/escamboapp/escambo\n"
%x(pwd)
"/home/pedro/workspace/escamboapp/escambo\n"
