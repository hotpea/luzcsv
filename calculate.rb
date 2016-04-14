load 'discounts.rb'
load 'orders.rb'

require 'date'
require 'fileutils'


# separate data in archives in arrays to easy manipulation
def separateInArrays params 
	validCoupons = Array.new
	orders 		   = Array.new
	orderItems   = Array.new
	products     = Array.new
	outputFile = nil

	params.each do |param|
		case param
			when 'coupons.csv'
				verifyIfValidDiscount param, validCoupons
			when 'order_items.csv'
				pushToArray param, orderItems
			when 'orders.csv'
				pushToArray param, orders
			when 'products.csv'
				pushToArray param, products
			when 'output.csv'
				outputFile = param
				pushToArray param, orderItems
			else
				# stop program if invalid file is passed
				puts 'arquivo "' + param + '" é inválido! passe arquivos válidos para o programa e tente novamente!'
				abort
		end
	end
	
	return validCoupons, orders, orderItems, products, outputFile
end

def mountOrders validCoupons, orders, orderItems, products, outputFile
	# pegar descontos
	finalOrders = Array.new

	orders.each do |order|
		idOrder, idCoupon = order.split ','
		totalCountItems, totalValueOrder = getItemsFromOrder orderItems, idOrder, products
		totalValueOrder = calculateDiscounts validCoupons, idCoupon, totalCountItems

		finalOrders.push idOrder.to_s + ',' + totalValueOrder.to_s
	end

	return finalOrders, outputFile
end

def pushToArray param, var
	File.foreach(param).each(sep="\r") do |line|
		var.push line
	end
end

def writeOutput toWrite, outputFile
	File.open(outputFile, 'w') do |file|
		toWrite.each do |line|
			file.puts line
		end

		puts '=============================================================================='
		puts 'Programa executado com Sucesso!!! dados gravados no arquivo "' + outputFile + '".'
		puts '=============================================================================='
	end
end