load 'discounts.rb'

require 'date'
require 'fileutils'

def separateInArrays params 
	validCoupons = Array.new
	orders 		   = Array.new
	orderItems   = Array.new
	products     = Array.new

	params.each do |param|
		# fazer tratamento para cada tipo de arquivo diferente
		# Separar pedidos no arquivo order(aqui temos o ID dos pedidos)
		# verificar os itens no arquivo order_itens(aqui temos o id do item e id do pedido)
		# pegar os preços no arquivo products de acordo com os itens do pedido(aqui temos os preços de cada produto)
		# verificar os descontos no arquivo de descontos, devem ser usados os descontos na ordem que aparecem:
		# OBS: Prestar atenção nos descontos vencidos e;ou já usados, o mesmo desconto só pode ser usado no max 3x. 
		
		case param
			when 'coupons.csv'
				verifyIfValidDiscount param, validCoupons
			when 'order_items.csv'
				pushToArray param, orderItems
			when 'orders.csv'
				pushToArray param, orders
			when 'products.csv'
				pushToArray param, products
			when 'output_test.csv'
				pushToArray param, orderItems
			else
				# stop program if invalid file is passed
				puts 'arquivo "' + param + '" é inválido! passe arquivos válidos para o programa e tente novamente!'
				abort
		end
	end
	
	mountOrders validCoupons, orders, orderItems, products
		
	# montar array com os valores finais dos pedidos e passar para writeOutput
	# writeOutput finalValues
end

def mountOrders validCoupons, orders, orderItems, products
	# pegar descontos
	finalOrders = Array.new

	orders.each do |order|
		idOrder, idCoupon = order.split ','
		totalCountItems = 0
		totalValueOrder = 0

		# get itens for order
		orderItems.each do |orderItem|
			idOrderInItem, idItem = orderItem.split ','

			if idOrderInItem.to_i == idOrder.to_i
				products.each do |product|
					idProduct, valueProduct = product.split ','
					if idItem.to_i == idProduct.to_i
						totalCountItems = totalCountItems + 1
						totalValueOrder = totalValueOrder.to_f + valueProduct.to_f
					end
				end
			end
		end

		# calculate discounts
		validCoupons.each do |coupon|
			# puts idOrder.to_s + '___1'
			# verify if the OrderCoupon is in any coupon and coupon can be used'
			if (coupon[0].to_i == idCoupon.to_i) and (coupon[4].to_i <= 3)
				# puts idOrder.to_s + '___2'
				if coupon[2] == 'percent'
					# puts idOrder.to_s + '___3'
					if totalCountItems > 1
						discountInPercent = (totalCountItems * 5).to_f
						totalValueOrder = (100 - discountInPercent).to_f * (totalValueOrder.to_f / 100)
					end
					totalValueOrder = totalValueOrder
				else
					totalValueOrder = totalValueOrder.to_f - coupon[1].to_f
				end
				# set +1 in used coupons
				coupon[4] = coupon[4].to_i + 1
			end
		end
		finalOrders.push idOrder.to_s + ',' + totalValueOrder.to_s
	end
	writeOutput finalOrders
end

def pushToArray param, var
	File.foreach(param).each(sep="\r") do |line|
		var.push line
	end
end

def writeOutput toWrite
	File.open('output_test.csv', 'w') do |file| 
		toWrite.each do |line|
			file.puts line
		end
	end
end