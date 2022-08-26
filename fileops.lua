--[[
The functions io.input and io.output always open a file in text mode. In POSIX, there is no dif-
ference between binary files and text files. In some systems like Windows, however, we must open binary
files in a special way, using the letter b in the mode string of io.open.
]]--

--[[
Typically, we read binary data either with the "a" pattern, that reads the whole file, or with the pattern
n, that reads n bytes. (Lines make no sense in a binary file.) As a simple example, the following program
converts a text file from Windows format to POSIX format —that is, it translates sequences of carriage
return–newlines to newlines:
]]--
--[[local inp = assert(io.open(arg[1], "rb"))
local out = assert(io.open(arg[2], "wb"))
local data = inp:read("a")
data = string.gsub(data, "\r\n", "\n")
out:write(data)
assert(out:close())

--As another example, the following program prints all strings found in a binary file:
local f = assert(io.open(arg[1], "rb"))
local data = f:read("a")
local validchars = "[%g%s]"
local pattern = "(" .. string.rep(validchars, 6) .. "+)\0"
for w in string.gmatch(data, pattern) do
print(w)
end
]]--
local f = assert(io.open(arg[1], "rb"))
local blocksize = 16
for bytes in f:lines(blocksize) do
    for i = 1, #bytes do
        local b = string.unpack("B", bytes, i)
        io.write(string.format("%02X ", b))
    end
    io.write(string.rep("", blocksize - #bytes))
    bytes = string.gsub(bytes, "%c", ".")
    io.write(" ", bytes, "\n")
end