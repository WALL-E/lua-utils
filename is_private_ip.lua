#!/usr/local/bin/lua

local function is_private_ip(addr)
    ip_sum = 0
    ip_count = 3
    for ip_i in string.gmatch(addr, [[%d+]]) do
        ip_sum = ip_sum + math.pow(256, ip_count) * ip_i
        ip_count = ip_count - 1
    end
    if ip_sum >= 0x7f000000 and ip_sum <= 0x7fffffff or -- 127.0.0.0 ~ 127.255.255.255
        ip_sum >= 0x0a000000 and ip_sum <= 0x0affffff or -- 10.0.0.0 ~ 10.255.255.255
        ip_sum >= 0xac100000 and ip_sum <= 0xac1fffff or -- 172.16.0.0 ~ 172.31.255.255
        ip_sum >= 0xc0a80000 and ip_sum <= 0xc0a8ffff then   -- 192.168.0.0 ~ 192.168.255.255
        return true
    else
        return false
    end
end



addr = "10.0.0.1"
print(addr)
print(is_private_ip(addr))

addr = "11.0.0.1"
print(addr)
print(is_private_ip(addr))

addr = "127.0.0.1"
print(addr)
print(is_private_ip(addr))

addr = "11.0.0.1"
print(addr)
print(is_private_ip(addr))

addr = "192.168.1.11"
print(addr)
print(is_private_ip(addr))

addr = "192.158.1.11"
print(addr)
print(is_private_ip(addr))
