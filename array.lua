local a = {}
-- new array
for i = 1, 1000 do
    a[i] = 0
end

--The length operator (#) uses this fact to find the size of an array:
print(#a)
--> 1000
--We can start an array at index zero, one, or any other value:
-- create an array with indices from -5 to 5
a = {}
for i = -5, 5 do
    a[i] = 0
end

--We can use a constructor to create and initialize arrays in a single expression:
squares = {1, 4, 9, 16, 25, 36, 49, 64, 81}

local mt = {}       -- create the matrix
for i = 1, N do
    local row = {}
    mt[i] = row         -- create a new row
    for j = 1, M do
        row[j] = 0
    end
end

