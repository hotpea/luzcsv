def verifyIfValidDiscount param, validCoupons
	# making a copy of coupons file
	couponsCopyFileName = "copy_#{param}"
	
	FileUtils.cp param, couponsCopyFileName 
	
	File.foreach(couponsCopyFileName).each(sep="\r") do |line|
		# split coupon line
		data = line.split ','
		
		# check if coupon isn't expired and store in validCoupons or used more than three times
		if (Date.parse(data[3]) > Date.today) and (data[4].to_i <= 3)
			validCoupons.push data
		end
	end
end

def calculateDiscounts validCoupons, idCoupon, totalCountItems
	# calculate discounts
	totalValueOrder = 0

	validCoupons.each do |coupon|
		# verify if the OrderCoupon is in any coupon and coupon can be used'
		if (coupon[0].to_i == idCoupon.to_i) and (coupon[4].to_i <= 3)
			if coupon[2] == 'percent'
				if totalCountItems > 1
					discountInPercent = (totalCountItems * 5).to_f
					# don't make discounts bigger than 40%
					if discountInPercent > 40
						discountInPercent = 40
					end
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

	totalValueOrder
end