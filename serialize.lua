
function serialize(o, depth, indent)
    if type(o) == "number" then
        io.write(o)
    elseif type(o) == "string" then
        io.write(string.format("%q", o))
    elseif type(o) == "table" then
        io.write("{\n")
        for k,v in pairs(o) do
            io.write(string.rep(" ", indent*(depth+1)), k, " = ")
            serialize(v, depth+1, indent)
            io.write(",\n")
        end
        io.write(string.rep(" ", indent*depth), "}")
    else
        error("cannot serialize a " .. type(o))
    end
end

--test--
io.write(string.rep("-", 30), "\n")
serialize({abc=10, bcdfe=10} , 0, 4)
io.write("\n", string.rep("-", 30), "\n")
serialize({a=10, bc=10, cdf={mno=10,no=20, xyz={y=100}}}, 0, 4)
io.write("\n", string.rep("-", 30), "\n")
