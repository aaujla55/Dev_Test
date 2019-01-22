-- ## Add required modules needed to support interface
local mapDB = require 'db.procedures'
local parseCsv = require 'csv'


-- The main function is the first function called from Iguana.
-- The Data argument will contain the message to be processed.


function main(Data)


   -- Initialize database
   local conn = mapDB.init()

  
   -- Parse CSV file
   local mappings = parseCsv(Data)
   trace(mappings)
   
   table.remove(mappings,1)
   trace(mappings)
   
   -- Create DB table
   local dbTable = dbs.init{filename='mappings.dbs'}
   local M = dbTable:tables()
   
   trace(mappings)

   -- Map into table
   for i=1, #mappings do
      M.procedures[i].ProcedureID = mappings[i][1]
      M.procedures[i].ProcedureDescription = mappings[i][2]
      M.procedures[i].IndicationID = mappings[i][3]
      M.procedures[i].IndicationDescription = mappings[i][4]
   end
   
   -- Merge
   conn:merge{data=M,live=true}
end