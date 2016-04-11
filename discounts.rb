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
	
	validCoupons
end 