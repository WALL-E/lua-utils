
#!/usr/local/bin/lua

function concat(...)
    local s = {}
    for _,v in pairs({...}) do
        assert(type(v) ~= "table")
        table.insert(s, v)
    end
    return table.concat(s)
end


print(pcall(concat, "123", "456", "c"))
print(pcall(concat, {"123", "456", "c"}))
