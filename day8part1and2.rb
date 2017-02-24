require 'matrix'
foundEnd = false
file = File.new("day8text.txt", "r")
m1 = Matrix.build(6, 50) { "." }

class Matrix 
  def to_readable
    i = 0
    self.each do |number|
      print number.to_s + " "
      i+= 1
      if i == self.column_size
        print "\n"
        i = 0
      end
    end
  end

  def []=(i, j, x)
    @rows[i][j] = x
  end
 end

class Object
  def is_number?
    self.to_f.to_s == self.to_s || self.to_i.to_s == self.to_s
  end
end

while line = file.gets do
	line.split("  ")

	if line[0..3].to_s == "rect"
		numbers = line[5..line.length].split("x")
		numbers[0].to_i.times do |n|
			numbers[1].to_i.times do |o|
				m1[o, n] = "#"
			end
		end
	elsif line[0..9] == "rotate col"
    #Find the shift
    shift = line.strip
    shift = shift[-2..-1]

    #Find the column number
    foundCol = line[16..-1].strip.split("")
    count = 0
    while foundEnd == false do 
      foundCol.each do |n|
        if n.is_number? == false
          foundEnd = true
        end
        if foundEnd == false 
          count += 1
        end
      end
    end
    col = foundCol[0..count-1]
    fullCol = ""
    col.each do |n|
      fullCol += n.to_s
    end
    numberCol = fullCol.to_i

    #Edit the column with the shift
    shift.to_i.times do 
      #Move the column by 1
      previousList = []
      6.times do |n|
        if n == 0
          prevPlace = 5
        else 
          prevPlace = n - 1
        end
        previousNumber = m1[prevPlace, numberCol]
        previousList.push(previousNumber)
      end
      previousList.length.times do |m|
        m1[m, numberCol] = previousList[m]
      end
    end
	elsif line [0..9] == "rotate row"
    #Find the shift
    shift = line.strip
    shift = shift[-2..-1].to_i

    #Find the row number
    foundRow = line[13..-1].strip.split("")
    count = 0
    while foundEnd == false do 
      foundRow.each do |n|
        if n.is_number? == false
          foundEnd = true
        end
        if foundEnd == false 
          count += 1
        end
      end
    end
    row = foundRow[0..count-1]
    fullRow = ""
    row.each do |n|
      fullRow += n.to_s
    end
    numberRow = fullRow.to_i

    #Edit the row with the shift
    shift.to_i.times do 
      #Move the column by 1
      previousList = []
      50.times do |n|
        if n == 0
          prevPlace = 49
        else 
          prevPlace = n - 1
        end
        previousNumber = m1[numberRow, prevPlace]
        previousList.push(previousNumber)
      end
      previousList.length.times do |m|
        m1[numberRow, m] = previousList[m]
      end
    end

		
	end
end

#Count # of '#'
onCount = 0
6.times do |n|
  50.times do |m|
    if m1[n,m] == "#"
      onCount += 1
    end
  end
end
puts onCount
m1.to_readable