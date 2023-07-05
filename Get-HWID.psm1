function Get-HWID
{
  <#
      .SYNOPSIS
      Enumerate Hardware Identifiers
      .DESCRIPTION
      Enumerate Hardware Identifiers , data can be redirected into a file or it can be setup as an exe bin open a cmd window (with fancy colors)
      .EXAMPLE
      Get-HWID
  #>
  ###################[Variables]###########################
  ${----} = '----------------------------------------------------------------------'
  ${==} = '======================================================================'
  $whitespace = ' '
  ###[System]###
  $system = (Get-WmiObject -Class Win32_ComputerSystemProduct)
  $bios = (Get-WmiObject -Class Win32_BIOS)
  $baseboard = (Get-WmiObject -Class Win32_BaseBoard)
  ###[Drives]###
  $drives = (Get-WmiObject -Class Win32_DiskDrive)
  ###[Network Adapter]###
  $adapters = (Get-NetAdapter)
  ###[Physical RAM]###
  $memoryModules = (Get-WmiObject -Class Win32_PhysicalMemory)
 ############################################################
 
  $multiLine = @"
$(Write-Host -Object 'Calvindd2f | Get-HWID')
$(Write-Host -Object $whitespace)   
$(Write-Host -Object 'System')
$(Write-Host -Object ${==})
$( 
Write-Host -Object ("BIOS UUID:        `t`t`t" + $system.UUID)
Write-Host -Object ("BIOS Serial:      `t`t`t" + $bios.SerialNumber)
Write-Host -Object ("Baseboard Serial: `t`t`t" + $baseboard.SerialNumber)
Write-Host -Object "Baseboard Asset Tag:`t`tDefault string"
Write-Host -Object "Enclosure Serial:   `t`tDefault string"
Write-Host -Object "Enclosure Asset Tag:`t`tDefault string"
)
$(Write-Host -Object $whitespace)    
$(Write-Host -Object 'Disk (HDD/SSD/NVMe)')
$(Write-Host -Object ${==})
$(foreach ($drive in $drives) 
{
Write-Host -Object ("Model:        `t`t " + $drive.Model)
Write-Host -Object ("Serial number:`t`t " + $drive.SerialNumber)
Write-Host -Object ${----}

})
$(Write-Host -Object $whitespace)  
$(Write-Host -Object 'Network Adapter (NIC)')
$(Write-Host -Object ${==})
$(foreach ($adapter in $adapters) 
{
Write-Host -Object ("Adapter:       `t`t " + $adapter.Name)
Write-Host -Object ("Current MAC:   `t`t " + $adapter.MacAddress)
# Permanent MAC is typically not available in the default cmdlets
Write-Host -Object "Permanent MAC:`t`t N/A"
Write-Host -Object ${----}

})
$(Write-Host -Object $whitespace)  
$(Write-Host -Object 'Physical RAM')
$(Write-Host -Object ${==})
$(foreach ($module in $memoryModules) 
{
Write-Host -Object ("Manufacturer:  `t`t " + $module.Manufacturer)
Write-Host -Object ("Serial:        `t`t " + $module.SerialNumber)
Write-Host -Object ("Asset tag:`t`t" + $module.AssetTag)
Write-Host -Object ${----}

})
$(Write-Host -Object $whitespace)               
$(
Write-Host -Object 'Power Supply'
Write-Host -Object ${==}
Write-Host -Object 'Serial:                 To Be Filled By O.E.M.'
Write-Host -Object 'Model part number:      To Be Filled By O.E.M.'
Write-Host -Object 'Asset tag number:       To Be Filled By O.E.M.'
Write-Host -Object ${----}
)
$(Write-Host -Object $whitespace)       
$(Read-Host -Prompt 'Press any key to continue . . .')
$(Write-Host -Object $whitespace)    
"@

  Write-Host -Object $multiLine
}
