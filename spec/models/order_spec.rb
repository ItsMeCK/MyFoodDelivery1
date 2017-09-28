require 'rails_helper'

describe Order do
	#before { @resource = FactoryGirl.create :order }
	context 'when order is created' do
		context 'valid order' do
	  	let(:order)  { Order.create(user_id: 1, address_id: 1, status: 'Placed') }
	    let!(:food_item) { FoodItem.create(name: 'James Bond', price: 100) }

		  it { expect{order}.not_to raise_error(ActiveModel::UnknownAttributeError) }

	    it 'should have items' do
	    	order.food_items << food_item
	    	expect(order.food_items.count).to eq(1)
	    end
		end

	  context 'invalid record'do
		  it 'without address' do
		  	expect{Order.create!(user_id: 1, status: 'Placed')}.to raise_error(ActiveRecord::RecordInvalid)
		  end

		  it 'without user' do
		  	expect{Order.create!(address_id: 1, status: 'Placed')}.to raise_error(ActiveRecord::RecordInvalid)
		  end
		end

	  it 'user signed in?' do
	  end

	  it 'should not place order without items' do
	  end

	  it 'total should be equalt to items total' do
	  end

	  it 'quantity of each item must be qreater than 1' do
	  end
	end


	context 'process order' do
		before { Address.create(user_id: 1, locality_id: 1)
			DeliveryBoy.create(name: 'ABC', locality_id: 1)
			@order = Order.create(user_id: 1, address_id: 1)
		 }

	  it 'should assign delivery boy' do
	  	 Order.process_order(@order.id)
	  	 @order = @order.reload
	  	 expect(@order.delivery_boy_id).to eq(1)
	  end
	end
end