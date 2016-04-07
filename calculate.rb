def calculate params 
	params.each do |param|
		puts "=================="+param+"=================="
		File.foreach(param).each(sep="\r").with_index do |line, line_index|
			puts "#{line_index}: #{line}"
		end
		puts "================end_"+param+"================"
	end
end