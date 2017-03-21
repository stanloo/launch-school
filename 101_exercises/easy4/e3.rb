# Forethoughts
=begin

1.
- input:
--- year as positive integer (>0)
- output:
--- true if lap year

4.
- lap year if / 4
-- not if / 100 unless / 400

=end

def leap_year?(year)
  if year % 4 == 0
    return true unless (year % 100 == 0 && year % 400 != 0)
  end
  false
end

# Sample solution
def leap_year?(year)
  (year % 4 == 0) && (year % 100 != 0 || year % 400 == 0)
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true
