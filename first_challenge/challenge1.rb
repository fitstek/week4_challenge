class Array 
	
	def fitsum(initial=nil, sym = nil)
	
	if initial == nil && sym == nil
		memo = self.first
		array_without_first_element = self.drop(1)
		array_without_first_element.each {|obj| memo = yield(memo,obj)}
	end

	if initial.class != Symbol && initial != nil && sym  == nil
		memo = initial 
		self.each {|obj| memo = yield(memo,obj)}
	end

	if initial != nil && sym != nil
		memo = initial
		self.each {|obj| memo = memo.method(sym).call(obj)}
	end

	if initial.class == Symbol
		memo = self.first
		array_without_first_element = self.drop(1)
		array_without_first_element.each do |obj| 
			memo = memo.method(initial).call(obj)
		end
	end
		 memo
	end
end





