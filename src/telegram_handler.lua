local api = require("telegram-bot-lua.core")

function api:bot_key()
    io.input('../key.txt')
    local file = io.read()
    local _,_, key, _ = string.find(file,"key=(.+)")

    io.close()
    return key
end

return api