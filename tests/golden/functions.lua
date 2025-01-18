local U = { foo = {} }

---NOTE: Local functions are not part of the documentation
---Multiply two integer and print it
---@param this number First number
---@param that number Second number
local function mul(this, that)
    print(this * that)
end

---Add two integer and print it
---
---NOTE: This will be part of the public API
---@param this number First number
---@param that? number
function U.sum(this, that)
    print(this + that or 0)
end

---Subtract second from the first integer
---@param this number
---@param that number Second number
---@return number
---Some secret number that
---we don't know about
---@usage `require('module.U').sub(10, 5)`
function U.sub(this, that)
    return this - that
end

---This is a magical function
---@param this number Non-magical number #1
---@param that number Non-magical number #2
---@return number _ The magical number #1
---@return number #The magical number #2
---and the fun part is the description can span
---
---over mulitple lines and preserves empty lines
---@see U.mul
---@see U.sum
---@see U.sub
U.magical = function(this, that)
    return (U.mul(this, that) / U.sum(that, this)), (U.sum(this, that) * U.sub(that, this))
end

---Function with variable arguments
---@param ... string[]
function U.with_var_arg(...) end

---@param x integer
---@param ... unknown
function U.with_var_arg_end(x, ...) end

---Class method deep access
---@return table
function U.foo:bar()
    self.__index = self
    return setmetatable({}, self)
end

---Method deep access
---@return table
function U.foo.baz()
    return U.foo:bar()
end

---Method with long name and signature just below tag spillover length
function U.very_long_function_name____________() end
---Method with long name and signature just above tag spillover length
function U.very_long_function_name_____________() end
---Method with long param and signature just below tag spillover length
---@param long_param_name______________ string
function U.short_function_name1(long_param_name______________) end
---Method with long param and signature just above tag spillover length
---@param long_param_name_______________ string
function U.short_function_name2(long_param_name_______________) end

return U
