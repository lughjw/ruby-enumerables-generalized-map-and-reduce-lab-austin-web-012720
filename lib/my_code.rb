# Yield passes the values in its arguments to be executed by the block
# that called it. That block's parameters are contained in pipes. Look at
# spec/generalized_map_and_reduce_spec.rb to see that part.

def map(source_array)
  new_array = []
  index = 0
  while index < source_array.size do 
    new_array[index] = yield(source_array[index])
    index += 1
  end
  
  new_array
end


def reduce(source_array, starting_point = nil)
  if starting_point != nil
    reduction = starting_point
    index = 0
  else
    reduction = source_array[0]
    index = 1
  end
  
  while index < source_array.size do
    #reduce
    reduction = yield(reduction,source_array[index])
    index += 1
  end
  
  reduction
end