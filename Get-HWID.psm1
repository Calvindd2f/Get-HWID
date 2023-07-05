###[System]###
$system = Get-WmiObject Win32_ComputerSystemProduct
$bios = Get-WmiObject Win32_BIOS
$baseboard = Get-WmiObject Win32_BaseBoard
###[Drives]###
$drives = Get-WmiObject Win32_DiskDrive
###[Network Adapter]###
$adapters = Get-NetAdapter
###[Physical RAM]###
$memoryModules = Get-WmiObject Win32_PhysicalMemory
###[Power Supply]###
#####################################################
        
$multiLine = @"
$(Write-Host "Calvindd2f | Get-HWID")
$(Write-Host " ")   
$(Write-Host "System")
$( 
  Write-Host "======================================================================"
  Write-Host ("BIOS UUID: " + $system.UUID)
  Write-Host ("BIOS Serial: " + $bios.SerialNumber)
  Write-Host ("Baseboard Serial: " + $baseboard.SerialNumber)
  Write-Host "Baseboard Asset Tag: Default string"
  Write-Host "Enclosure Serial: Default string"
  Write-Host "Enclosure Asset Tag: Default string"
  )
  $(Write-Host " ")    
  $(Write-Host "Disk (HDD/SSD/NVMe)")
$(foreach ($drive in $drives) {
    Write-Host "======================================================================"
    Write-Host ("Model: " + $drive.Model)
    Write-Host ("Serial number: " + $drive.SerialNumber)
    Write-Host "----------------------------------------------------------------------"
})
$(Write-Host " ")  
$(write-host 'Network Adapter (NIC)')
$(foreach ($adapter in $adapters) {
    Write-Host "======================================================================"
    Write-Host ("Adapter: " + $adapter.Name)
    Write-Host ("Current MAC: " + $adapter.MacAddress)
    # Permanent MAC is typically not available in the default cmdlets
    Write-Host "Permanent MAC: N/A"
    Write-Host "----------------------------------------------------------------------"
})
$(Write-Host " ")  
$(write-host 'Physical RAM')
$(foreach ($module in $memoryModules) {
    Write-Host "======================================================================"
    Write-Host ("Manufacturer: " + $module.Manufacturer)
    Write-Host ("Serial: " + $module.SerialNumber)
    Write-Host ("Asset tag: " + $module.AssetTag)
    Write-Host "----------------------------------------------------------------------"
})
$(Write-Host " ")               
$(
Write-Host "Power Supply"
Write-Host "======================================================================"
Write-Host "Serial:                  To Be Filled By O.E.M."
Write-Host "Model part number:       To Be Filled By O.E.M."
Write-Host "Asset tag number:        To Be Filled By O.E.M."
Write-Host "----------------------------------------------------------------------"
)
$(Write-Host " ")       
$(Read-Host "Press any key to continue . . .")
$(Write-Host " ")    
"@
Write-Host $multiLine
