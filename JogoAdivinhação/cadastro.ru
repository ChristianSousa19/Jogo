class Produto
    attr_accessor :nome, :preco, :quantidade
  
    def initialize(nome, preco, quantidade)
      @nome = nome
      @preco = preco
      @quantidade = quantidade
    end
  
    def to_s
      "Produto: #{@nome}, Preço: R$#{@preco}, Quantidade: #{@quantidade}"
    end
  end
  
  class CadastroProdutos
    def initialize
      @produtos = []
    end
  
    def adicionar_produto(nome, preco, quantidade)
      produto = Produto.new(nome, preco, quantidade)
      @produtos << produto
    end
  
    def listar_produtos
      @produtos.each { |produto| puts produto }
    end
  
    def buscar_produto(nome)
      produtos_encontrados = @produtos.select { |produto| produto.nome.downcase.include?(nome.downcase) }
      produtos_encontrados.each { |produto| puts produto }
    end
  
    def remover_produto(nome)
      @produtos.reject! { |produto| produto.nome.downcase == nome.downcase }
    end
  end
  
  cadastro = CadastroProdutos.new
  
  puts "### CADASTRO DE PRODUTOS ###"
  
  loop do
    puts "\nOpções disponíveis:"
    puts "1. Adicionar produto"
    puts "2. Listar produtos"
    puts "3. Buscar produto"
    puts "4. Remover produto"
    puts "5. Sair"
    print "Digite o número da opção desejada: "
    opcao = gets.chomp.to_i
  
    case opcao
    when 1
      print "Digite o nome do produto: "
      nome = gets.chomp
      print "Digite o preço do produto: "
      preco = gets.chomp.to_f
      print "Digite a quantidade do produto: "
      quantidade = gets.chomp.to_i
      cadastro.adicionar_produto(nome, preco, quantidade)
      puts "Produto adicionado com sucesso!"
    when 2
      puts "\n### LISTA DE PRODUTOS ###"
      cadastro.listar_produtos
    when 3
      print "Digite o nome do produto que deseja buscar: "
      nome = gets.chomp
      puts "\n### PRODUTOS ENCONTRADOS ###"
      cadastro.buscar_produto(nome)
    when 4
      print "Digite o nome do produto que deseja remover: "
      nome = gets.chomp
      cadastro.remover_produto(nome)
      puts "Produto removido com sucesso!"
    when 5
      puts "Encerrando o programa..."
      break
    else
      puts "Opção inválida! Por favor, tente novamente."
    end
  end
  