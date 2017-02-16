
triangleCount = 0
isATriangle = true
file = File.new("day3.txt", "r")
while (line = file.gets)
	numbers = line.split(" ")
	sum1and2 = numbers[0].to_i + numbers[1].to_i
	sum2and3 = numbers[1].to_i + numbers[2].to_i
	sum1and3 = numbers[0].to_i + numbers[2].to_i
	if sum1and2 <= numbers[2].to_i
		isATriangle = false
	elsif sum1and3 <= numbers[1].to_i
		isATriangle = false
	elsif sum2and3 <= numbers[0].to_i
		isATriangle = false
	end
	if isATriangle == true 
		triangleCount += 1
	end
	isATriangle = true
end
file.close
puts triangleCount