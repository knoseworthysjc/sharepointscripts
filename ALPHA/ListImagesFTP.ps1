   
    #Set server name, user, password and directory
    $server = 'ftp://images.alphabroder.com/'
    $username = 'BBimages'
    $password = 'brodimgs'
    $directory ='Hi-Res Web Images'
    $url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"
    #$conn = Connect-PnPOnline -Url $url -UseWebLogin
    $start = 4015
    $count = 0
    #Function call to get directory listing
    #$filelist = Get-FTPFileList -server $server -username $username -password $password -directory $directory
    
    #Write output
    #Write-Output $filelist 
    try 
     {
        #Create URI by joining server name and directory path
        $uri =  "$server$directory" 
    
        #Create an instance of FtpWebRequest
        $FTPRequest = [System.Net.FtpWebRequest]::Create($uri)
        
        #Set the username and password credentials for authentication
        $FTPRequest.Credentials = New-Object System.Net.NetworkCredential($username, $password)
       
        #Set method to ListDirectoryDetails to get full list
        #For short listing change ListDirectoryDetails to ListDirectory
        $FTPRequest.Method = [System.Net.WebRequestMethods+Ftp]::ListDirectoryDetails
        $FTPRequest.UseBinary = $False
        $FTPRequest.KeepAlive = $False

        #Get FTP response
        $FTPResponse = $FTPRequest.GetResponse() 
        
        #Get Reponse data stream
        $ResponseStream = $FTPResponse.GetResponseStream()
        
        #Read data Stream
        $StreamReader = New-Object System.IO.StreamReader $ResponseStream  
       
        #Read each line of the stream and add it to an array list
        #$files = New-Object System.Collections.ArrayList
        $DirListing = (($StreamReader.ReadToEnd()) -split [Environment]::NewLine)
        
        $StreamReader.Close()
        
        $DirListing = $DirListing[2..($DirListing.Length-2)] 

        $FTPResponse.Close()
        foreach ($CurLine in $DirListing) {

            # Split line into space separated array
            $LineTok = ($CurLine -split '\ +')
    
            # Get the filename (can even contain spaces)
            $CurFile = $LineTok[8..($LineTok.Length-1)]
    
            # Figure out if it's a directory. Super hax.
            $DirBool = $LineTok[0].StartsWith("d")
    
            # Determine what to do next (file or dir?)
            Add-Content "AlphaFtpFileName.txt" "$CurFile"
            
        }


    }
    catch {
        #Show error message if any
        write-host -message $_.Exception.InnerException.Message
    }
    
        #Close the stream and response
        
        
        