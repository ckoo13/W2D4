require "byebug"

def no_dupes?(arr)
    answer = []
    hash = Hash.new(0)

    arr.each do |ele|
        hash[ele] += 1
    end

    hash.each do |k,v|
        if v < 2
            answer.push(k)
        end
    end

    answer
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    arr.each_with_index do |ele, i|
        if ele == arr[i + 1]
            return false
        end
    end

    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    answer = Hash.new([])

    str.each_char.with_index do |char,i|
        if !answer.has_key?(char)
            answer[char] = [i]
        else
            answer[char].push(i)
        end
    end

    answer
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    hash = Hash.new("")
    i = 0
    back_pointer = 0

    while back_pointer < str.length
        front_pointer = back_pointer
        debugger
        while front_pointer < str.length
            if str[front_pointer] != str[back_pointer]
                hash[i] = str[back_pointer...front_pointer]
                i += 1
                break
            end

            front_pointer += 1
        end

        back_pointer = front_pointer
    end

    hash
    
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

#helper methods for bi_prime?
def prime?(num)
    if num < 2
        return false
      end
    
      (2...num).each do |factor|
        if num % factor == 0
          return false
        end
      end
    
      return true
end

def pick_primes(numbers)
    answer = numbers.select { |ele1| prime?(ele1)}
    return answer
end

def bi_prime?(num)
    array = []
    (2..num).each do |i|
        array << i
    end

    prime_array = pick_primes(array)

    prime_array.each do |num_1|
        prime_array.each do |num_2|
            if num_1 * num_2 == num
                return true
            end
        end
    end

    false
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

