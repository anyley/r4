def sum_pairs(arr, sum)
	diff = {}
	arr.each do |item|
		return [diff[item], item] if diff.has_key?(item)
		diff[sum - item] = item
	end
	nil
end

a =  [10, 5, 2, 3, 7, 5]
p sum_pairs(a, 10)
