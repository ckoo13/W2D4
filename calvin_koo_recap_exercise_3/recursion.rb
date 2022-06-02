def multiply(a, b)
    if b > 0
        if b == 0
            return 0
        else
            return multiply(a, b - 1) + a
        end
    else
        if b == 0
            return 0
        else
            return multiply(a, b + 1) - a
        end
    end
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(n)
    if n == 0
        return []
    elsif n == 1
        return [2]
    elsif n == 2
        return [2,1]
    else
        arr = lucas_sequence(n-1)
        arr.push(arr[arr.length - 1] + arr[arr.length - 2])
        return arr
    end
end

p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]