-- The main function is the first function called from Iguana.
-- The Data argument will contain the message to be processed.
function main(Data)

   -- 1) Initialize database connection

   -- 2) Take an HL7 Message and parse it using vmd
   local Msg, Name = hl7.parse{vmd='demo.vmd', data=Data}

   -- 3) Create table if needed for the first time
   --dbFunc.SQLiteTableCreation(conn)

   -- 3) Check if table got created

   -- 4) Create the table node tree for merging into the DB

   -- 5) Add data to the table node tree

   -- 6) Merge the data into Patient table

   --7) read all patient's demographic information


end