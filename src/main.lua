local api = require('telegram_handler')
local users = require('users')

local register_process = 0

local name,password
api.configure(api:bot_key())

function api.on_message(message)
    if message.text
            and message.text:match('/register') and register_process == 0
    then
        register_process = 1
        api.send_message(
        message.chat.id,
        'Type your name:'
        )
    end

    if message.text ~= '/register' and register_process == 1
        then
        register_process = 2
        name = message.text
        api.send_message(
        message.chat.id,
        'Type your password:'
    )
    end

    if message.text ~= '/register' and message.text ~= name and register_process == 2 then
        register_process = 0
        password = message.text
        api.send_message(
        message.chat.id,
        users.register_user(name,password)
        )

        name,password = "", ""
    end
end

api.run()