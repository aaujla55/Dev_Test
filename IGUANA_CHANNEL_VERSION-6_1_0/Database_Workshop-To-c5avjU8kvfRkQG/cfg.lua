-- All values below are CASE SENSITIVE !!! -----
-- http://help.interfaceware.com/v6/import-database-schema

local config = require 'encrypt.password'

-- how to change password for DB password :
-- To change the database name, user, password and database API type you'll need to 
--  1) Enter them into these lines
--  2) Uncomment the lines.
--  3) Recomment the lines
--  4) Remove the password and host from the file before you same a milestone

--config.save{password='password',config='DBConfig.xml', key='AFHDSKHAFkhfkdsj7325648kljgflsk'}

local configurations = {}

configurations.DatabaseCfg = {
   ['DATABASE_NAME'] = 'test',
   ['DBUSER']     = 'root',
   ['DBUSERPWD'] = config.load{config='DBConfig.xml', key='AFHDSKHAFkhfkdsj7325648kljgflsk'}
}


return configurations