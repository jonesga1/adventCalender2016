arrayOfFive = []
arrayOfLine = []
charAndNumber = []
totalCount = 0
currentCharCount = 0
notSorted = false
file = File.new("day4.txt", "r")
while (line = file.gets)
	fiveChars = line[line.length-7..line.length-3].to_s
	5.times do |n|
		arrayOfFive.push(fiveChars[n])
	end
	roomValue = line[line.length-11..line.length-7].to_i
	lineToRead = line[0..line.length-12].to_s
	lineToRead.length.times do |m|
		arrayOfLine.push(lineToRead[m])
	end
	arrayOfFive.each do |p|
		arrayOfLine.each do |q|
			if p == q
				currentCharCount += 1
			end
		end
		charAndNumber.push("#{p}:#{currentCharCount}")
		currentCharCount = 0
	end
	4.times do |r|
		currentVar = charAndNumber[r].split(":")
		nextVar = charAndNumber[r+1].split(":")
		if currentVar[1].to_i == nextVar[1].to_i
			letters = []
			letters.push(currentVar[0], nextVar[0])
			correctLetters = letters.sort
			if correctLetters[0] != letters[0]
				notSorted = true
			end
		elsif currentVar[1].to_i < nextVar[1].to_i
			notSorted = true
		end		
	end
	puts charAndNumber
	if notSorted == false 
		puts "This is a real room!"
		totalCount += roomValue
		puts "Current total of rooms is #{totalCount}!"
	else
		puts "Not a real room!"
	end
	arrayOfLine = []
	arrayOfFive = []
	charAndNumber = []
	notSorted = false
end
