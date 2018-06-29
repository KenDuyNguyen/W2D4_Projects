require 'byebug'

def my_min(list)
  smallest = list.first
  
  list.each do |int1|           
      if smallest > int1
        smallest = int1
      end   
    end 
  smallest 
end       #linear O(n)

def my_min2(list)  #linear O(n^2)
  list.each_with_index do |el, idx|
    smallest = true 
    list.each_with_index do |el2, idx2|
      next if idx == idx2
      smallest = false if el2 < el
    end
    
     return el if smallest 
  end 
end

# Largest Contiguous Sub-sum
def sub_sum(list)
  sub_arrays = [] 
  
  list.each_index do |idx|
    ((idx)...(list.length)).each do |idx2|
      sub_arrays << list[idx..idx2]
    end 
  end 
  sub_arrays.map! {|sub_array| sub_array.reduce(:+)}.max 
end 

def better_sum(list) 
  largest = 0 
  current = 0 
  
  list.each do |el|
    current += el 
    current = 0 if current < 0 
    largest = current if current > largest 
  end
  largest 
end 

p largest_contiguous_subsum(list)

def first_anagram?(first_word, second_word)
  anagrams = first_word.chars.permutations.to_a
  anagrams.any? { |string| string.join("") == second_word}
end 

p anagram?("gizmo", "sally")    #=> false
p anagram?("elvis", "lives")    #=> true