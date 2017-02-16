triangleCount = 0
isATriangle = true
column1 = []
column2 = []
column3 = []
counter = 0
file = File.new("day3.txt", "r")
while (line = file.gets)
	numbers = line.split(" ")
	column1.push(numbers[0].to_i)
	column2.push(numbers[1].to_i)
	column3.push(numbers[2].to_i)
	counter += 1
	if counter == 3
		sum1and2 = column1[0] + column1[1]
		sum2and3 = column1[1] + column1[2]
		sum1and3 = column1[0] + column1[2]
		if sum1and2 <= column1[2]
			isATriangle = false
		elsif sum1and3 <= column1[1]
			isATriangle = false
		elsif sum2and3 <= column1[0]
			isATriangle = false
		end
		if isATriangle == true 
			triangleCount += 1
		end
		isATriangle = true
		sum1and2 = column2[0] + column2[1]
		sum2and3 = column2[1] + column2[2]
		sum1and3 = column2[0] + column2[2]
		if sum1and2 <= column2[2]
			isATriangle = false
		elsif sum1and3 <= column2[1]
			isATriangle = false
		elsif sum2and3 <= column2[0]
			isATriangle = false
		end
		if isATriangle == true 
			triangleCount += 1
		end
		isATriangle = true
		sum1and2 = column3[0] + column3[1]
		sum2and3 = column3[1] + column3[2]
		sum1and3 = column3[0] + column3[2]
		if sum1and2 <= column3[2]
			isATriangle = false
		elsif sum1and3 <= column3[1]
			isATriangle = false
		elsif sum2and3 <= column3[0]
			isATriangle = false
		end
		if isATriangle == true 
			triangleCount += 1
		end
		isATriangle = true
		column1 = []
		column2 = []
		column3 = []
		counter = 0
	end
end
file.close
puts triangleCount