# total = 0
# (1..1000).each do |i|
#   # puts i ** i
#   total = total + (i ** i)
# end
#
# puts total.to_s.split(//).last(10).join

#####################
#
start = Time.now.to_i
current = 20

while true do
  result = true
  (11..20).each do |del|
    if current % del != 0
      result = false
      break
    end
  end

  if result
    puts current
    break
  end

  current += 20
end

puts Time.now.to_i - start
# sum = 0

# ################

# (1...1000).to_a.each do |val|
#   if val % 5 == 0|| val % 3 == 0
#     sum += val
#   end
# end
#
# puts sum