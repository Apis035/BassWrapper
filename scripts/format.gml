var i, str;

str = argument0

for (i=1; i<argument_count; i+=1)
    str = string_replace(str, "$", string(argument[i]))

str = string_replace_all(str, "    ", "")
str = string_replace(str, chr(13)+chr(10), "")

return str
