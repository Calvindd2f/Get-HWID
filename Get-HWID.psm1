$multiLine = @"
Calvindd2f | Get-HWID 

System
======================================================================
BIOS UUID:               
BIOS Serial:             System Serial Number
Baseboard Serial:        
Baseboard Asset Tag:     Default string
Enclosure Serial:        Default string
Enclosure Asset Tag:     Default string


Disk (HDD/SSD/NVMe)
======================================================================
Model:                   
Serial number:                       
----------------------------------------------------------------------
Model:                   
Serial number:           
----------------------------------------------------------------------
Model:                   
Serial number:                       
----------------------------------------------------------------------
Model:                   
Serial number:           
----------------------------------------------------------------------


Network Adapter (NIC)
======================================================================
Adapter:                
Current MAC:            
Permanent MAC:          
----------------------------------------------------------------------
Adapter:                 
Current MAC:             
Permanent MAC:           
----------------------------------------------------------------------
Adapter:                 
Current MAC:            
Permanent MAC:          
----------------------------------------------------------------------


Physical RAM
======================================================================
Manufacturer:            $Manufacturer
Serial:                  
Asset tag:               
----------------------------------------------------------------------
Manufacturer:            
Serial:                  
Asset tag:               
----------------------------------------------------------------------


Power Supply
======================================================================
Serial:                  To Be Filled By O.E.M.
Model part number:       To Be Filled By O.E.M.
Asset tag number:        To Be Filled By O.E.M.
----------------------------------------------------------------------


Press any key to continue . . .

"@
Write-Host $multiLine