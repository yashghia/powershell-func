function Get-FirstRecurringCharacter {
   [CmdletBinding()]
   param (
     [string]$InputString
   )

   $ErrorActionPreference = 'Stop'
   $VerbosePreference = 'Continue'
   try{
        if(([string]::IsNullOrEmpty($InputString))){
            write-verbose "Empty or Null input"
            break
        }
        $InputString.ToCharArray() | ForEach-Object{ 
            if($InputString.IndexOf($_) -ne $InputString.LastIndexOf($_)){
                write-verbose "1st Repeating char is = $_";
                $_; 
                break; 
            } 
        }
        write-verbose "no repeating char found"
   }
   catch{
        throw "Error executing script: $_"
   }
}

# Runtime complexity for script will be O(S), where S is length of string. 
