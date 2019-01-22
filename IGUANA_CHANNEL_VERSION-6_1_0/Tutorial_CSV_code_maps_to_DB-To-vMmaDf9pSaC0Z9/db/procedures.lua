local mapDB = {}

function mapDB.init() 

   local conn = db.connect{
      api=db.SQLITE,
      name='Training/Procedures/mappingsDB.sqlite'}

   
   local tables, err = pcall(checkTables,conn)
   trace (tables)
   
   if tables == false then 
      trace (err) 
      conn:execute{sql=createProcedures(),live=true}
   end
   
   
   return conn
end


function checkTables(conn)  

   local tables = conn:query{sql=[[SELECT * FROM 'procedures']]}
   return tables

end


function createProcedures()  

   local sql = [[CREATE TABLE `procedures` (
	`ProcedureID`	INTEGER,
	`ProcedureDescription`	TEXT,
	`IndicationID`	INTEGER,
	`IndicationDescription`	TEXT,
	PRIMARY KEY(IndicationID)
);]]
   
   return sql

end

return mapDB
