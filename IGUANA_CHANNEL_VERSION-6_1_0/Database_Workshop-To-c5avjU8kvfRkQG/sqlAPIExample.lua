local queries = require 'sqlScripts'
local NewSchema = require 'dbs.api'

local databaseOperations = {}

-- Get schema of a database object
function databaseOperations.GetSchema(conn)
   local Schema = NewSchema()
   trace(Schema)
   Schema:import{connection = conn}  
   local Def = Schema:dbs{}
   local D = dbs.init{definition=Def}
   local A = D:tables()
   -- 5) Try examining A
 
   -- We can clear the schema
   Schema:clear{}
   return A
end

-- Create a table in sqlite datatbase
function databaseOperations.SQLiteTableCreation(conn)
   -- Set "live = true" to delete the Patient table
   -- this can be used to delete a Patient table that is not
   -- working (probably because it has a the wrong fields)
   -- ALTERNATIVELY: if you need to *keep* the current Patient 
   -- table you can change the DB name in db.connect{} in main()  
   conn:execute{sql= queries.DROP_PATIENT_TABLE,live = false}  -- change to "true" to delete Patient table
 
   -- create Patient table if it does not exist
   conn:execute{sql= queries.CREATE_PATIENT_TABLE, live = true}
end

function databaseOperations.getAllTables(conn)
   -- Get All tables
   return conn:query{sql= queries.GET_ALL_TABLES,live= false}
end


function databaseOperations.getAllPatients(conn)
   -- Get Patient Demographic information
   return conn:query{sql= queries.GET_PATIENTS,live= true}
end

return databaseOperations