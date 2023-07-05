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
$(Write-Host "======================================================================")
$( 
  Write-Host ("BIOS UUID:`t`t " + $system.UUID)
  Write-Host ("BIOS Serial:`t`t " + $bios.SerialNumber)
  Write-Host ("Baseboard Serial:`t`t " + $baseboard.SerialNumber)
  Write-Host "Baseboard Asset Tag:`t`t Default string"
  Write-Host "Enclosure Serial:`t`t Default string"
  Write-Host "Enclosure Asset Tag:`t`t Default string"
  )
  $(Write-Host " ")    
  $(Write-Host "Disk (HDD/SSD/NVMe)")
  $(Write-Host "======================================================================")
$(foreach ($drive in $drives) {
    Write-Host ("Model:`t`t " + $drive.Model)
    Write-Host ("Serial number:`t`t " + $drive.SerialNumber)
    Write-Host "----------------------------------------------------------------------"
})
$(Write-Host " ")  
$(write-host 'Network Adapter (NIC)')
$(Write-Host "======================================================================")
$(foreach ($adapter in $adapters) {
    Write-Host ("Adapter:`t`t " + $adapter.Name)
    Write-Host ("Current MAC:`t`t " + $adapter.MacAddress)
    # Permanent MAC is typically not available in the default cmdlets
    Write-Host "Permanent MAC:`t`t N/A"
    Write-Host "----------------------------------------------------------------------"
})
$(Write-Host " ")  
$(write-host 'Physical RAM')
$(Write-Host "======================================================================")
$(foreach ($module in $memoryModules) {
    Write-Host ("Manufacturer:`t`t " + $module.Manufacturer)
    Write-Host ("Serial:`t`t " + $module.SerialNumber)
    Write-Host ("Asset tag:`t`t " + $module.AssetTag)
    Write-Host "----------------------------------------------------------------------"
})
$(Write-Host " ")               
$(
Write-Host "Power Supply"
Write-Host "======================================================================"
Write-Host "Serial:                 To Be Filled By O.E.M."
Write-Host "Model part number:      To Be Filled By O.E.M."
Write-Host "Asset tag number:       To Be Filled By O.E.M."
Write-Host "----------------------------------------------------------------------"
)
$(Write-Host " ")       
$(Read-Host "Press any key to continue . . .")
$(Write-Host " ")    
"@
Write-Host $multiLine
