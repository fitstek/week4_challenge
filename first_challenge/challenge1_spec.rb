require 'challenge1'

describe Array do
	context 'fitsum is a method just like inject' do
		it 'can take a block with arguments and return the result' do
			array = [1,2,3,4]
			expect(array.fitsum(0) {|memo, obj| memo + obj}).to eq 10
		end

		it 'can take a block and return the result(multiplication)' do
			array = [1,2,3,4]
			expect(array.fitsum(1) {|memo, obj| memo * obj}).to eq 24
		end
		it 'can take a block without arguments and return the result(addition)' do
			array = [1,2,3,4]
			expect(array.fitsum {|memo, obj| memo + obj}).to eq 10
		end

		it 'can take a symbol with initial value' do
			array = [1,2,3,4]
			expect(array.fitsum(0, :+)).to eq 10
		end

		it 'can take a symbol without initial value' do
			array = [1,2,3,4]
			expect(array.fitsum(:+)).to eq 10
		end

		it 'can take a symbol with initial value' do
			array = [1,2,3,4]
			expect(array.fitsum(0, :-)).to eq -10
		end

		it 'can take a symbol without initial value' do
			array = [1,2,3,4]
			expect(array.fitsum(:-)).to eq -8
		end
	end
end