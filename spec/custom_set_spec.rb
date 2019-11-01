require 'custom_set'

RSpec.describe CustomSet do

	it 'set without elements is empty' do
	   expect(CustomSet.new []).to be_empty
	end

	it 'set with elements is not empty' do
		expect(CustomSet.new [1]).not_to be_empty
	end

	it 'nothing is a member of empty set' do
		set = CustomSet.new []
		expect(set.member? 1).to be false
	end

	it 'when element is in the set' do
		set = CustomSet.new [1, 2, 3]
		expect(set.member? 1).to be true
	end

	it 'when element is not in the set' do
		set = CustomSet.new [1, 2, 3]
		expect(set.member? 4).to be false
	end

	it 'empty set is a subset of another empty set' do
	    set1 = CustomSet.new []
		set2 = CustomSet.new []
		expect(set1.subset? set2).to be true
	end

	it 'non empty set is not a subset of empty set' do
	    set1 = CustomSet.new []
		set2 = CustomSet.new [2]
		expect(set1.subset? set2).to be true
	end

	it  'empty set is not a subset of nonempty set' do
	    set1 = CustomSet.new [1]
		set2 = CustomSet.new []
		expect(set1.subset? set2).to be false
	end

	it 'set is a subset of the set with the same elements' do
	    set1 = CustomSet.new [1, 2, 3]
		set2 = CustomSet.new [1, 2, 3]
		expect(set1.subset? set2).to be true
	end

	it  'set is a subset of larger set with the same elements' do
	    set1 = CustomSet.new [1, 2, 3]
		set2 = CustomSet.new [3, 1, 2, 4]
		expect(set1.subset? set2).to be true
	end

	it  'set is not a subset of set that doed not contain its elements' do
	    set1 = CustomSet.new [1, 5, 3]
		set2 = CustomSet.new [3, 2, 4]
		expect(set1.subset? set2).to be false
	end

	it 'empty set is disjoint with itself' do
	    set1 = CustomSet.new []
		set2 = CustomSet.new []
		expect(set1.disjoint? set2).to be true
	end

	it 'non empty set is disjoint with empty set' do
	    set1 = CustomSet.new [1]
		set2 = CustomSet.new []
		expect(set1.disjoint? set2).to be true
	end

	it  'empty set is disjoint with non empty set' do
	    set1 = CustomSet.new []
		set2 = CustomSet.new [3]
		expect(set1.disjoint? set2).to be true
	end

	it 'set are not disjoint if they share an element' do
	    set1 = CustomSet.new [1, 2]
		set2 = CustomSet.new [1, 3]
		expect(set1.disjoint?set2).to be false
	end

	it  'sets are disjoint if they share no elements' do
	    set1 = CustomSet.new [1, 2, 3]
		set2 = CustomSet.new [4, 5, 6]
		expect(set1.disjoint? set2).to be true
	end

#equal
	it  'empty sets are equal' do
	    set1 = CustomSet.new []
		set2 = CustomSet.new []
		expect(set1).to eq set2
	end

	it  'sets with the same elements are equal' do
	    set1 = CustomSet.new [1, 2]
		set2 = CustomSet.new [2, 1]
		expect(set1).to eq set2
	end

	it  'empty set is not equal to non empty set' do
	    set1 = CustomSet.new []
		set2 = CustomSet.new [1, 2, 3]
		expect(set1).not_to eq set2
	end

	it  'non empty set is not equal to empty set' do
	    set1 = CustomSet.new [1, 2]
		set2 = CustomSet.new []
		expect(set1).not_to eq set2
	end

	it  'setes with different elements are not equal' do
	    set1 = CustomSet.new [1, 2, 5]
		set2 = CustomSet.new [1, 2, 3]
		expect(set1).not_to eq set2
	end

#add
	it  'add to empty set' do
	    set1 = CustomSet.new []
		expected = CustomSet.new [3]
		expect(expected).to eq set1.add(3)
	end

	it  'add to non empty set' do
	    set1 = CustomSet.new [1, 2]
		expected = CustomSet.new [1, 2, 3]
		expect(expected).to eq set1.add(3)
	end

	it  'addinng an existing elemenet does not change the set' do
	    set1 = CustomSet.new [1, 2, 3]
		expected = CustomSet.new [1, 2, 3]
		expect(expected).to eq set1.add(3)
	end

#intersection
	it  'insersion of two empty sets is an empty set' do
	    set1 = CustomSet.new []
		set2 = CustomSet.new []
		expected = CustomSet.new []
		expect(expected).to eq set1.intersection(set2)
	end

	it  'insersion of  empty set and non empty is an empty set' do
	    set1 = CustomSet.new []
		set2 = CustomSet.new [1, 2, 3, 4]
		expected = CustomSet.new []
		expect(expected).to eq set1.intersection(set2)
	end

	
	it  'insersion of  non empty and empty is an empty set' do
	    set1 = CustomSet.new [1, 2, 3, 4]
		set2 = CustomSet.new []
		expected = CustomSet.new []
		expect(expected).to eq set1.intersection(set2)
	end

	it  'insersion of  two sets not sharing elemenet is an empty set' do
	    set1 = CustomSet.new [1, 2, 3, 4]
		set2 = CustomSet.new [5, 6, 7]
		expected = CustomSet.new []
		expect(expected).to eq set1.intersection(set2)
	end

	it  'insersion of two sets sharing elemenet is non empty set' do
	    set1 = CustomSet.new [1, 2, 5, 3, 4]
		set2 = CustomSet.new [2, 5, 6, 7]
		expected = CustomSet.new [2, 5]
		expect(expected).to eq set1.intersection(set2)
	end

#difference
	it  'difference of two empty sets is an empty set' do
	    set1 = CustomSet.new []
		set2 = CustomSet.new []
		expected = CustomSet.new []
		expect(expected).to eq set1.difference(set2)
	end

	it  'difference  of  empty set and non empty' do
	    set1 = CustomSet.new []
		set2 = CustomSet.new [1, 2, 3, 4]
		expected = CustomSet.new []
		expect(expected).to eq set1.difference (set2)
	end

	
	it  'difference of  non empty and empty' do
	    set1 = CustomSet.new [1, 2, 3, 4]
		set2 = CustomSet.new []
		expected = CustomSet.new [1,2, 3, 4]
		expect(expected).to eq set1.difference(set2)
	end

	it  'difference  of  two non empty sets ' do
	    set1 = CustomSet.new [1, 2, 3, 4]
		set2 = CustomSet.new [ 1, 2, 5, 6, 7]
		expected = CustomSet.new [3, 4]
		expect(expected).to eq set1.difference(set2)
	end

#union
	it  'unionof two empty sets is an empty set' do
	    set1 = CustomSet.new []
		set2 = CustomSet.new []
		expected = CustomSet.new []
		expect(expected).to eq set1.union(set2)
	end

	it  'union of  empty set and non empty' do
	    set1 = CustomSet.new []
		set2 = CustomSet.new [1, 2, 3, 4]
		expected = CustomSet.new [1, 2, 3, 4]
		expect(expected).to eq set1.union (set2)
	end

	
	it  'union of  non empty and empty' do
	    set1 = CustomSet.new [1, 2, 3, 4]
		set2 = CustomSet.new []
		expected = CustomSet.new [1, 2, 3, 4]
		expect(expected).to eq set1.union (set2)
	end

	it  'union of two non empty sets ' do
	    set1 = CustomSet.new [1, 2]
		set2 = CustomSet.new [1, 3]
		expected = CustomSet.new [1, 2, 3]
		expect(expected).to eq set1.union (set2)
	end

end
