# Forethoughts
=begin

1.
- input:
--- year as integer (assume 0..infinity)
- output:
--- century number + st/nd/rd/th
----- 1901-2000 => 20th

3.
- convert century number into string to check for last digits
- century number ends with
--- 1 -> st (unless 11)
--- 2 -> nd (unless 12)
--- 3 -> rd (unless 13)
--- 4-9 -> th

4.
- convert year to century number by dividing / 100
--- if last digit of year != 0, then add 1 to century number
- add ending according to conditions (case statement)
=end

def century_suffix(century)
  case
  when century.end_with?(*%w(11 12 13)) then 'th'
  when century.end_with?('1') then 'st'
  when century.end_with?('2') then 'nd'
  when century.end_with?('3') then 'rd'
  else 'th'
  end
end

def century(year)
  century = year / 100
  century += 1 if year % 100 != 0
  century = century.to_s
  century + century_suffix(century)
end


puts century(2000) == '20th'
puts century(2050) == '21st'
puts century(2001) == '21st'
puts century(2265) == '23rd'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'