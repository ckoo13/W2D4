# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]

#helper function for all_vowel_pairs
def check_all_vowels(word)
    vowels = "aeiou"
    vowel_hash = Hash.new(0)

    word.each_char do |char|
        if vowels.include?(char)
            vowel_hash[char] += 1
        end
    end

    if vowel_hash.size() != 5
        return false
    else
        return true
    end
end

#helper function for all_vowel_pairs
def check_pairs(pair_1, pair_2)
    array_1 = pair_1.split(" ")
    array_2 = pair_2.split(" ")

    array_1.each do |word|
        if array_2.include?(word)
            return true
        end
    end

    false
end

def all_vowel_pairs(words)
    vowels = "aeiou"
    answer = []

    words.each_with_index do |word_1, idx_1|
        words.each_with_index do |word_2, idx_2|
            pair = word_1 + " " + word_2
            if check_all_vowels(pair) && idx_2 > idx_1
                answer.push(pair)
            end
        end
    end

    answer
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    i = 2

    while i < num
        if num % i == 0
            return true
        end

        i += 1
    end

    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    answer = []

    bigrams.each do |bigram|
        if str.include?(bigram)
            answer << bigram
        end
    end

    answer
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        answer = Hash.new()

        if prc == nil
            self.each do |k,v|
                if k == v
                    answer[k] = v
                end
            end
        else
            self.each do |k,v|
                if prc.call(k,v)
                    answer[k] = v
                end
            end
        end

        answer
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        substrings = []
        
        pointer_1 = 0
        pointer_2 = pointer_1

        while pointer_1 < self.length
            pointer_2 = pointer_1
            while pointer_2 < self.length
                substrings << self[pointer_1..pointer_2]
                pointer_2 += 1
            end

            pointer_1 += 1
        end

        new_substrings = []

        if length == nil
            return substrings
        else
            substrings.each do |str|
                if str.length == length
                    new_substrings << str
                end
            end
        end

        new_substrings

    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        answer = ""

        self.each_char.with_index do |char, i|
            currentIndex = alphabet.index(char)
            newIndex = currentIndex + num
            newChar = alphabet[newIndex % alphabet.length]
            answer += newChar
        end

        answer
    end
end
