-- PART 1
if small_input then
    io.input("day01_input_small.txt", r)
else
    io.input("day01_input_large.txt", r)
end

local sum = 0
for line in io.lines() do
    local digits = {}
    for digit in string.gmatch(line, "%d") do
        digits[#digits + 1] = digit
    end
    sum = sum + 10 * digits[1] + digits[#digits]
end
print("Part 1: "..sum)

-- PART 2
if small_input then
    io.input("day01_input_small2.txt", r)
else
    io.input("day01_input_large.txt", r)
end

sum = 0
local alphabet = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "1", "2", "3", "4", "5", "6", "7", "8", "9"}
for line in io.lines() do
    local digits = {}
    local first_digit_position, last_digit_position, first_digit_value, last_digit_value = math.huge, 0, 0, 0
    for index, token in ipairs(alphabet) do
        local pos = 0
        while true do
            pos = string.find(line, token, pos+1)
            if pos == nil then break end
            local value = tonumber(token)
            if value == nil then value = index end
            if pos < first_digit_position then
                first_digit_position = pos
                first_digit_value = value
            end
            if pos > last_digit_position then
                last_digit_position = pos
                last_digit_value = value
            end
        end
    end
    sum = sum + 10 * first_digit_value + last_digit_value
end
print("Part 2: "..sum)
