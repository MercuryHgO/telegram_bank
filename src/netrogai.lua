local pgmoon = require('pgmoon')

local pg = pgmoon.new({
        host = "localhost",
        port = "5432",
        database = "bank",
        user = "postgres",
        password = "postgres"
    })
assert(pg:connect())
local status, err = pg:query(   'INSERT INTO "users" (name,password) VALUES (\'TEST9\',\'TEST4\'); INSERT INTO "users" (name,password) VALUES (\'TEST10\',\'TEST4\')')
if(status == nil) then
        print(err)
end
