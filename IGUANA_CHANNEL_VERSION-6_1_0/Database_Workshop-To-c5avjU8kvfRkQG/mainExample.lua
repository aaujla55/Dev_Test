local dbFunc = require 'sqlAPI'
local db2 = require "db2"
local cfg = require "cfg"
local map = require 'Map'

-- 1) Initialize database connection
local conn = db2.connect{
   api= db.SQLITE, 
   name= cfg.DatabaseCfg.DATABASE_NAME,
   user= cfg.DatabaseCfg.DBUSER,
   password = cfg.DatabaseCfg.DBUSERPWD,
   live = true}

-- The main function is the first function called from Iguana.
-- The Data argument will contain the message to be processed.
function main(Data)

   -- 2) Take an HL7 Message and parse it using vmd
   local Msg, Name = hl7.parse{vmd='demo.vmd', data=Data}

   -- 3) Create table if needed for the first time
   --dbFunc.SQLiteTableCreation(conn)

   -- 4) Check if table got created
   dbFunc.getAllTables(conn)

   -- 5) Create the table node tree for merging into the DB
   local Out = dbFunc.GetSchema(conn)


   local Success, Schema = pcall(dbFunc.GetSchema, conn)    
   if Success then
      --KEEP PROCESSING
      -- 6) Add data to the table node tree
      Out = map.mapPatient(Msg.PID, Out)

      -- 7) Merge the data into Patient table
      conn:merge{data=Out, live=true}
   else
      if type(Schema)=='table' then
         Schema = Schema.message
      end
      iguana.logError('Error occured:'..Schema)
   end

   --8) read all patients
   dbFunc.getAllPatients(conn)

end