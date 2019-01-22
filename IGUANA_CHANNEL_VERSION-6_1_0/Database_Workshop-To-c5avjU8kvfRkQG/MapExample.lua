local mappings = {}

-- We map Mrn to the Patient ID Number
function mappings.mapPatient(PID, Out)
   Out.Patient[1].Id         = PID[3][1][1]
   Out.Patient[1].LastName      = PID[5][1][1][1]
   Out.Patient[1].GivenName     = PID[5][1][1][1]
   Out.Patient[1].Race          = PID[10][1][1]
   Out.Patient[1].PhoneHome     = PID[13][1][1]
   Out.Patient[1].PhoneBusiness = PID[14][1][1]
   Out.Patient[1].Religion      = PID[17][2]
   Out.Patient[1].MaritalStatus = PID[16][2]
   Out.Patient[1].Ssn           = PID[19]
   Out.Patient[1].LicenseNumber = PID[20][1]
   return Out
end



return mappings