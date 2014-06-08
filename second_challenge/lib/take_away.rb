require 'twilio-ruby'

class Menu
	def initialize
		@list = {food: 10, food2: 12, food3: 14, food4: 8}
	end

	def list
		@list
	end
end

class Order

	attr_reader :food
	attr_reader :quantity
	attr_reader :list_of_orders

	def initialize(food, number = 1)
			@food, @quantity = food, number
			@list_of_orders = []
	end

	def add_food_to_list_of_orders(new_order)
		if blob?(food)
			quantity.times { list_of_orders << new_order } 
			#send_message
		else
			puts "Please choose food that is on the menu."
		end
	end

	def blob?(food)
		Menu.new.list.keys.include?(food)
	end

	def number_ordered_equal_to_total
		list_of_orders.count == quantity
	end

	def send_message
		account_sid = 'AC9d65c7ebb3013a8807f3ff3c0925e48e'
		auth_token = '4bfaad3f5989ad4253e8ec0c1f9a403d'
		client = Twilio::REST::Client.new account_sid, auth_token

		message = client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{(Time.now + 3600).strftime("%H:%M")}",
    		:to => "+447415970134",     # Replace with your phone number
    		:from => "+441276300045")   # Replace with your Twilio number
		#puts message.sid
	end
end