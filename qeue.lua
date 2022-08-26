--[[A simple way to implement queues in Lua is with functions insert and remove from the table
library. As we saw in the section called “The Table Library”, these functions insert and remove elements
in any position of an array, moving other elements to accommodate the operation. However, these moves
can be expensive for large structures. A more efficient implementation uses two indices, one for the first
element and another for the last. With that representation, we can insert or remove an element at both ends
in constant time, as shown in Figure 14.2, “A double-ended queue”.]]--
function listNew ()
    return {first = 0, last = -1}
    end
    function pushFirst (list, value)
    local first = list.first - 1
    list.first = first
    list[first] = value
    end
    function pushLast (list, value)
    local last = list.last + 1
    list.last = last
    list[last] = value
    end
    function popFirst (list)
    local first = list.first
    if first > list.last then error("list is empty") end
    local value = list[first]
    list[first] = nil
    -- to allow garbage collection
    list.first = first + 1
    return value
    end
    function popLast (list)
    local last = list.last
    if list.first > last then error("list is empty") end
    local value = list[last]
    list[last] = nil
    -- to allow garbage collection
    list.last = last - 1
    return value
    end