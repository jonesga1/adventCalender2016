startpath = "R4, R4, L1, R3, L5, R2, R5, R1, L4, R3, L5, R2, L3, L4, L3, R1, R5, R1, L3, L1, R3, L1, R2, R2, L2, R5, L3, L4, R4, R4, R2, L4, L1, R5, L1, L4, R4, L1, R1, L2, R5, L2, L3, R2, R1, L194, R2, L4, R49, R1, R3, L5, L4, L1, R4, R2, R1, L5, R3, L5, L4, R4, R4, L2, L3, R78, L5, R4, R191, R4, R3, R1, L2, R1, R3, L1, R3, R4, R2, L2, R1, R4, L5, R2, L2, L4, L2, R1, R2, L3, R5, R2, L3, L3, R3, L1, L1, R5, L4, L4, L2, R5, R1, R4, L3, L5, L4, R5, L4, R5, R4, L3, L2, L5, R4, R3, L3, R1, L5, R5, R1, L3, R2, L5, R5, L3, R1, R4, L5, R4, R2, R3, L4, L5, R3, R4, L5, L5, R4, L4, L4, R1, R5, R3, L1, L4, L3, L4, R1, L5, L1, R2, R2, R4, R4, L5, R4, R1, L1, L1, L3, L5, L2, R4, L3, L5, L4, L1, R3"
x = 0
y = 0

orientation = 0
steps = 0

seen = []

startpath.split(", ").each do |n|
	if n[0] == "R" && orientation == 3
		orientation = 0
	elsif n[0] == "L" && orientation == 0
		orientation = 3
	elsif n[0] == "L"
		orientation -= 1
	elsif n[0] == "R"
		orientation += 1
	end

	if orientation == 0
		steps = n[1..n.length].to_i
		steps.times do |p|
			y += 1
			seen.each do |m|
			numbers = m.split(",")
			if numbers[0].to_i == x && numbers[1].to_i == y
				puts x 
				puts y
			end
			end
			seen.push("#{x},#{y}")
		end
	elsif orientation == 1
		steps = n[1..n.length].to_i
		steps.times do |p|
			x += 1
			seen.each do |m|
			numbers = m.split(",")
			if numbers[0].to_i == x && numbers[1].to_i == y
				puts x 
				puts y
			end
		end
			seen.push("#{x},#{y}")
		end
	elsif orientation == 2
		steps = n[1..n.length].to_i
		steps.times do |p|
			y -= 1
			seen.each do |m|
			numbers = m.split(",")
			if numbers[0].to_i == x && numbers[1].to_i == y
				puts x 
				puts y
			end
		end
			seen.push("#{x},#{y}")
		end
	elsif orientation == 3
		steps = n[1..n.length].to_i
		steps.times do |p|
			x -= 1
			seen.each do |m|
			numbers = m.split(",")
			if numbers[0].to_i == x && numbers[1].to_i == y
				puts x 
				puts y
			end
		end
			seen.push("#{x},#{y}")
		end
	end
		
end

