local sha1 = require('sha1')
local pgmoon = require('pgmoon')
local users = {}

users.register_user = function(name, password)
    local password = sha1.sha1(password)
    local pg = pgmoon.new({
        host = "localhost",
        port = "5432",
    database = "bank",
    user = "postgres",
    password = "postgres"
    })
    assert(pg:connect())
    local status, err = pg:query(   'INSERT INTO "users" (name,password) VALUES (\'' .. name .. '\',\''.. password ..'\');')
    if(status == nil) then
        return err
    end
    return 'Welcome '.. name ..'!'
end

-- users.register_user('qwe','qwe')

users.autorize_user = function(name, password)

end

return users