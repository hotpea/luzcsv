load 'discounts.rb'
load 'calculate.rb'

params = ARGV

# class calculate
validCoupons, orders, orderItems, products, outputFile  = separateInArrays params
finalOrders, outputFile                                 = mountOrders validCoupons, orders, orderItems, products, outputFile
writeOutput finalOrders, outputFile


