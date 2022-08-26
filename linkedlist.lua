--[[Because tables are dynamic entities, it is easy to implement linked lists in Lua. We represent each node
with a table (what else?); links are simply table fields that contain references to other tables. For instance,
let us implement a singly-linked list, where each node has two fields, value and next. A simple variable
is the list root:]]--
list = nil
--To insert an element at the beginning of the list, with a value v, we do this:
list = {next = list, value = v}
--To traverse the list, we write this:
local l = list
while l do
visit l.value
l = l.next
end