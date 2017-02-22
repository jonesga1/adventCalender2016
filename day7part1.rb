file = File.new("day7text.txt", "r")

trueIPcount = 0
trueIP = true
checkAbba = []
newArray = []

while line = file.gets do 
	brackets = line.scan(/\[(.*?)\]/)
	brackets.length.times do |n|
		checkAbba.push(brackets[n].to_s.scan(/(.)(?!\1)(.)\2\1/))
	end
	newArray = checkAbba.reject { |c| c.empty?}

	if newArray.length > 0
		trueIP = false
	else
		if line.to_s.scan(/(.)(?!\1)(.)\2\1/).length > 0
			trueIP = true
		else
			trueIP = false
		end
	end

	if trueIP
		trueIPcount += 1
		puts "Is an ip"
	else
		puts "Not an ip"
	end

	checkAbba = []
	newArray = []
end

puts trueIPcount