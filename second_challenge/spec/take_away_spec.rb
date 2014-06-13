require 'take_away'

describe 'Takeaway' do
	#context 'menu' do
	it 'menu can print a list of foods with corresponding prices' do
		menu = Menu.new
		expect(menu.list[:food]).to eq 10
	end

	it 'can place order'  do
		order = Order.new(:food) 
		order.add_food_to_list_of_orders(order)
		expect(order.list_of_orders).to include(order)
	end

	it "won't place order if food not in menu"  do
		order = Order.new(:food5) 
		menu = Menu.new
		order.add_food_to_list_of_orders(order)
		expect(order.list_of_orders).to_not include(:food5)
	end

	it 'checks the food exist in the menu' do
		order = Order.new(:food5)
		menu = Menu.new
		expect(order.is_the_ordered_food_on_the_menu?(order.food)).to be false
	end

	it 'checks the food exist in the menu' do
		order = Order.new(:food4)
		menu = Menu.new
		expect(order.is_the_ordered_food_on_the_menu?(order.food)).to be true
	end


	it 'knows the quantity of the order' do
		order = Order.new(:food1, 4)
		order.add_food_to_list_of_orders(order)
		expect(order.quantity).to eq (4)
	end

	it 'knows the quantity of the order' do
		order = Order.new(:food1)
		order.add_food_to_list_of_orders(order)
		expect(order.quantity).to eq (1)
	end

	it 'checks total number of foods ordered to total' do
		order = Order.new(:food, 4)
		order.add_food_to_list_of_orders(order)
		expect(order.number_ordered_equal_to_total).to be true
	end
end