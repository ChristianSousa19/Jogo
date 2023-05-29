def validar_numero(numero)
  if numero.to_i.to_s == numero
    numero.to_i
  else
    puts "Por favor, digite um número válido."
    nil
  end
end

def verificar_palpite(palpite, numero_secreto)
  if palpite == numero_secreto
    puts "Parabéns! Você acertou o número secreto!"
    return true
  elsif palpite < numero_secreto
    puts "O número secreto é maior do que #{palpite}. Tente novamente."
  else
    puts "O número secreto é menor do que #{palpite}. Tente novamente."
  end
  false
end

def jogar_adivinhacao
  puts "Bem-vindo ao jogo de Adivinhação!"
  puts "Eu vou pensar em um número entre 1 e 100. Tente adivinhar!"

  numero_secreto = rand(1..100)
  tentativas_restantes = 10

  while tentativas_restantes > 0
    puts "\nTentativas restantes: #{tentativas_restantes}"
    print "Digite seu palpite: "
    palpite = validar_numero(gets.chomp)

    next unless palpite

    if verificar_palpite(palpite, numero_secreto)
      puts "Fim do jogo!"
      return
    end

    tentativas_restantes -= 1
  end

  puts "Você perdeu! O número secreto era #{numero_secreto}."
  puts "Fim do jogo!"
end

jogar_adivinhacao
