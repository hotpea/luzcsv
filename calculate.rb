load 'discounts.rb'

require 'date'
require 'fileutils'

def separateInArrays params 
	params.each do |param|
		# fazer tratamento para cada tipo de arquivo diferente
		# Separar pedidos no arquivo order(aqui temos o ID dos pedidos)
		# verificar os itens no arquivo order_itens(aqui temos o id do item e id do pedido)
		# pegar os preços no arquivo products de acordo com os itens do pedido(aqui temos os preços de cada produto)
		# verificar os descontos no arquivo de descontos, devem ser usados os descontos na ordem que aparecem:
		# OBS: Prestar atenção nos descontos vencidos e;ou já usados, o mesmo desconto só pode ser usado no max 3x. 
		
		validCoupons = Array.new
		orders 		 = Array.new
		orderItens   = Array.new
		products     = Array.new
		
		case param
			when 'coupons.csv'
				validCoupons = verifyIfValidDiscount param, validCoupons
			when 'order_items.csv'
				pushToArray param, orderItens
			when 'orders.csv'
				pushToArray param, orders
			when 'products.csv'
				pushToArray param, products
			when 'output_test.csv'
				pushToArray param, orderItens
			else
				# stop program if invalid file is passed
				puts 'arquivo ' + param + ' é inválido! passe arquivos válidos para o programa e tente novamente!'
				abort
		end
		
		mountOrders validCoupons, orders, orderItens, products
		
		# montar array com os valores finais dos pedidos e passar para writeOutput
		# writeOutput finalValues
	end
end

def mountOrders validCoupons, orders, orderItens, products
	finalOrders = Array.new
	orders.each do |order|
		# calcular desconto e itens por pedido, index = ID, value = final value
		finalOrders[order[0]] = 'valor final'
	end
end

def pushToArray param, var
	File.foreach(param).each(sep="\r") do |line|
		var.push line.split ','
	end
end

def writeOutput toWrite
	File.open('output_test.csv', 'w') do |file| 
		toWrite.each do |line|
			file.puts line
		end
	end
end