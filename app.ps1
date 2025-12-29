Import-Module ".\modules\Pode\2.12.1\Pode.psd1"

Start-PodeServer{
    Add-PodeEndpoint -Address 0.0.0.0 -Port 8001 -Protocol Http
    Set-PodeViewEngine -Type Pode -Extension '.pode'

    Write-Host "[*]Iniciando HackMyBugs en el puerto 8001..."
    Add-PodeStaticRoute -Path "/static" -Source "./static"

    Add-PodeRoute -Method Get -Path "/" -ScriptBlock {
        Write-PodeViewResponse -Path 'index.pode'
    }

    Add-PodeRoute -Method Get -Path "/about" -ScriptBlock {
        $info = @{
            creador="InfernoidPl4y"
            gmail="infernoidpl4y@gmail.com"
            powerby="Pode"
            podev="v2.12.1"
            github="https://github.com/InfernoidPl4y"
            portafolio="https://infernoidpl4y.netlify.app"
            webprojects="https://ip4hub.blogspot.com/"
            styleservus="SERVUS Bug Bounty Styles"
            stylevultus="VULTUS Styles"
            version="1.0"
        }

        Write-PodeViewResponse -Path 'about.pode' -Data @{
            Info=$info
        }
    }
    Add-PodeRoute -Method Get -Path "/my" -ScriptBlock {
        $userId=("487359"+$WebEvent.Query['id']+"879312")
        $userRealId=$WebEvent.Query['id']
        $msg=$WebEvent.Query['msg']
        $userData=(Get-Content -Path "./db/users.json" | ConvertFrom-Json | Select-Object $userId)
        Write-PodeViewResponse -Path 'my.pode' -Data @{
            User=($userData.$userId)
            UserId=$userRealId
            Msg=$msg
        }
    }
    Add-PodeRoute -Method Get -Path "/blog" -ScriptBlock {
        $posts=(Get-Content -Path "./db/posts.json" | ConvertFrom-Json)
        Write-PodeViewResponse -Path "blog.pode" -Data @{
            Posts=$posts
            Cant=$posts.cant
            Post=""
        }
    }

    Add-PodeRoute -Method Get -Path "/bugsai" -ScriptBlock {
        $chatDB=(Get-Content -Path "./db/chat.json" | ConvertFrom-Json)
        Write-PodeViewResponse -Path "bugsai.pode" -Data @{
            Message=$chatDB
            Cant=$chatDB.cant
        }
    }

    Add-PodeRoute -Method Get -Path "/log" -ScriptBlock {
        $file=$WebEvent.Query['file']
        Write-PodeFileResponse -Path "./db/$($file)"
    }

    Add-PodeRoute -Method Get -Path "/store" -ScriptBlock {
        $search=$WebEvent.Query['search']
        $asus=@( "ASUS", "Laptop", "Vivobook", "Go", "15", "ASUS Laptop", "ASUS Vivobook", "ASUS Go", "ASUS 15", "Laptop ASUS", "Laptop Vivobook", "Laptop Go", "Laptop 15", "Vivobook ASUS", "Vivobook Laptop", "Vivobook Go", "Vivobook 15", "Go ASUS", "Go Laptop", "Go Vivobook", "Go 15", "15 ASUS", "15 Laptop", "15 Vivobook", "15 Go", "ASUS Laptop Vivobook", "ASUS Laptop Go", "ASUS Laptop 15", "ASUS Vivobook Laptop", "ASUS Vivobook Go", "ASUS Vivobook 15", "ASUS Go Laptop", "ASUS Go Vivobook", "ASUS Go 15", "ASUS 15 Laptop", "ASUS 15 Vivobook", "ASUS 15 Go", "Laptop ASUS Vivobook", "Laptop ASUS Go", "Laptop ASUS 15", "Laptop Vivobook ASUS", "Laptop Vivobook Go", "Laptop Vivobook 15", "Laptop Go ASUS", "Laptop Go Vivobook", "Laptop Go 15", "Laptop 15 ASUS", "Laptop 15 Vivobook", "Laptop 15 Go", "Vivobook ASUS Laptop", "Vivobook ASUS Go", "Vivobook ASUS 15", "Vivobook Laptop ASUS", "Vivobook Laptop Go", "Vivobook Laptop 15", "Vivobook Go ASUS", "Vivobook Go Laptop", "Vivobook Go 15", "Vivobook 15 ASUS", "Vivobook 15 Laptop", "Vivobook 15 Go", "Go ASUS Laptop", "Go ASUS Vivobook", "Go ASUS 15", "Go Laptop ASUS", "Go Laptop Vivobook", "Go Laptop 15", "Go Vivobook ASUS", "Go Vivobook Laptop", "Go Vivobook 15", "Go 15 ASUS", "Go 15 Laptop", "Go 15 Vivobook", "15 ASUS Laptop", "15 ASUS Vivobook", "15 ASUS Go", "15 Laptop ASUS", "15 Laptop Vivobook", "15 Laptop Go", "15 Vivobook ASUS", "15 Vivobook Laptop", "15 Vivobook Go", "15 Go ASUS", "15 Go Laptop", "15 Go Vivobook", "ASUS Laptop Vivobook Go", "ASUS Laptop Vivobook 15", "ASUS Laptop Go Vivobook", "ASUS Laptop Go 15", "ASUS Laptop 15 Vivobook", "ASUS Laptop 15 Go", "ASUS Vivobook Laptop Go", "ASUS Vivobook Laptop 15", "ASUS Vivobook Go Laptop", "ASUS Vivobook Go 15", "ASUS Vivobook 15 Laptop", "ASUS Vivobook 15 Go", "ASUS Go Laptop Vivobook", "ASUS Go Laptop 15", "ASUS Go Vivobook Laptop", "ASUS Go Vivobook 15", "ASUS Go 15 Laptop", "ASUS Go 15 Vivobook", "ASUS 15 Laptop Vivobook", "ASUS 15 Laptop Go", "ASUS 15 Vivobook Laptop", "ASUS 15 Vivobook Go", "ASUS 15 Go Laptop", "ASUS 15 Go Vivobook", "Laptop ASUS Vivobook Go", "Laptop ASUS Vivobook 15", "Laptop ASUS Go Vivobook", "Laptop ASUS Go 15", "Laptop ASUS 15 Vivobook", "Laptop ASUS 15 Go", "Laptop Vivobook ASUS Go", "Laptop Vivobook ASUS 15", "Laptop Vivobook Go ASUS", "Laptop Vivobook Go 15", "Laptop Vivobook 15 ASUS", "Laptop Vivobook 15 Go", "Laptop Go ASUS Vivobook", "Laptop Go ASUS 15", "Laptop Go Vivobook ASUS", "Laptop Go Vivobook 15", "Laptop Go 15 ASUS", "Laptop Go 15 Vivobook", "Laptop 15 ASUS Vivobook", "Laptop 15 ASUS Go", "Laptop 15 Vivobook ASUS", "Laptop 15 Vivobook Go", "Laptop 15 Go ASUS", "Laptop 15 Go Vivobook", "Vivobook ASUS Laptop Go", "Vivobook ASUS Laptop 15", "Vivobook ASUS Go Laptop", "Vivobook ASUS Go 15", "Vivobook ASUS 15 Laptop", "Vivobook ASUS 15 Go", "Vivobook Laptop ASUS Go", "Vivobook Laptop ASUS 15", "Vivobook Laptop Go ASUS", "Vivobook Laptop Go 15", "Vivobook Laptop 15 ASUS", "Vivobook Laptop 15 Go", "Vivobook Go ASUS Laptop", "Vivobook Go ASUS 15", "Vivobook Go Laptop ASUS", "Vivobook Go Laptop 15", "Vivobook Go 15 ASUS", "Vivobook Go 15 Laptop", "Vivobook 15 ASUS Laptop", "Vivobook 15 ASUS Go", "Vivobook 15 Laptop ASUS", "Vivobook 15 Laptop Go", "Vivobook 15 Go ASUS", "Vivobook 15 Go Laptop", "Go ASUS Laptop Vivobook", "Go ASUS Laptop 15", "Go ASUS Vivobook Laptop", "Go ASUS Vivobook 15", "Go ASUS 15 Laptop", "Go ASUS 15 Vivobook", "Go Laptop ASUS Vivobook", "Go Laptop ASUS 15", "Go Laptop Vivobook ASUS", "Go Laptop Vivobook 15", "Go Laptop 15 ASUS", "Go Laptop 15 Vivobook", "Go Vivobook ASUS Laptop", "Go Vivobook ASUS 15", "Go Vivobook Laptop ASUS", "Go Vivobook Laptop 15", "Go Vivobook 15 ASUS", "Go Vivobook 15 Laptop", "Go 15 ASUS Laptop", "Go 15 ASUS Vivobook", "Go 15 Laptop ASUS", "Go 15 Laptop Vivobook", "Go 15 Vivobook ASUS", "Go 15 Vivobook Laptop", "15 ASUS Laptop Vivobook", "15 ASUS Laptop Go", "15 ASUS Vivobook Laptop", "15 ASUS Vivobook Go", "15 ASUS Go Laptop", "15 ASUS Go Vivobook", "15 Laptop ASUS Vivobook", "15 Laptop ASUS Go", "15 Laptop Vivobook ASUS", "15 Laptop Vivobook Go", "15 Laptop Go ASUS", "15 Laptop Go Vivobook", "15 Vivobook ASUS Laptop", "15 Vivobook ASUS Go", "15 Vivobook Laptop ASUS", "15 Vivobook Laptop Go", "15 Vivobook Go ASUS", "15 Vivobook Go Laptop", "15 Go ASUS Laptop", "15 Go ASUS Vivobook", "15 Go Laptop ASUS", "15 Go Laptop Vivobook", "15 Go Vivobook ASUS", "15 Go Vivobook Laptop", "ASUS Laptop Vivobook Go 15", "ASUS Laptop Vivobook 15 Go", "ASUS Laptop Go Vivobook 15", "ASUS Laptop Go 15 Vivobook", "ASUS Laptop 15 Vivobook Go", "ASUS Laptop 15 Go Vivobook", "ASUS Vivobook Laptop Go 15", "ASUS Vivobook Laptop 15 Go", "ASUS Vivobook Go Laptop 15", "ASUS Vivobook Go 15 Laptop", "ASUS Vivobook 15 Laptop Go", "ASUS Vivobook 15 Go Laptop", "ASUS Go Laptop Vivobook 15", "ASUS Go Laptop 15 Vivobook", "ASUS Go Vivobook Laptop 15", "ASUS Go Vivobook 15 Laptop", "ASUS Go 15 Laptop Vivobook", "ASUS Go 15 Vivobook Laptop", "ASUS 15 Laptop Vivobook Go", "ASUS 15 Laptop Go Vivobook", "ASUS 15 Vivobook Laptop Go", "ASUS 15 Vivobook Go Laptop", "ASUS 15 Go Laptop Vivobook", "ASUS 15 Go Vivobook Laptop", "Laptop ASUS Vivobook Go 15", "Laptop ASUS Vivobook 15 Go", "Laptop ASUS Go Vivobook 15", "Laptop ASUS Go 15 Vivobook", "Laptop ASUS 15 Vivobook Go", "Laptop ASUS 15 Go Vivobook", "Laptop Vivobook ASUS Go 15", "Laptop Vivobook ASUS 15 Go", "Laptop Vivobook Go ASUS 15", "Laptop Vivobook Go 15 ASUS", "Laptop Vivobook 15 ASUS Go", "Laptop Vivobook 15 Go ASUS", "Laptop Go ASUS Vivobook 15", "Laptop Go ASUS 15 Vivobook", "Laptop Go Vivobook ASUS 15", "Laptop Go Vivobook 15 ASUS", "Laptop Go 15 ASUS Vivobook", "Laptop Go 15 Vivobook ASUS", "Laptop 15 ASUS Vivobook Go", "Laptop 15 ASUS Go Vivobook", "Laptop 15 Vivobook ASUS Go", "Laptop 15 Vivobook Go ASUS", "Laptop 15 Go ASUS Vivobook", "Laptop 15 Go Vivobook ASUS", "Vivobook ASUS Laptop Go 15", "Vivobook ASUS Laptop 15 Go", "Vivobook ASUS Go Laptop 15", "Vivobook ASUS Go 15 Laptop", "Vivobook ASUS 15 Laptop Go", "Vivobook ASUS 15 Go Laptop", "Vivobook Laptop ASUS Go 15", "Vivobook Laptop ASUS 15 Go", "Vivobook Laptop Go ASUS 15", "Vivobook Laptop Go 15 ASUS", "Vivobook Laptop 15 ASUS Go", "Vivobook Laptop 15 Go ASUS", "Vivobook Go ASUS Laptop 15", "Vivobook Go ASUS 15 Laptop", "Vivobook Go Laptop ASUS 15", "Vivobook Go Laptop 15 ASUS", "Vivobook Go 15 ASUS Laptop", "Vivobook Go 15 Laptop ASUS", "Vivobook 15 ASUS Laptop Go", "Vivobook 15 ASUS Go Laptop", "Vivobook 15 Laptop ASUS Go", "Vivobook 15 Laptop Go ASUS", "Vivobook 15 Go ASUS Laptop", "Vivobook 15 Go Laptop ASUS", "Go ASUS Laptop Vivobook 15", "Go ASUS Laptop 15 Vivobook", "Go ASUS Vivobook Laptop 15", "Go ASUS Vivobook 15 Laptop", "Go ASUS 15 Laptop Vivobook", "Go ASUS 15 Vivobook Laptop", "Go Laptop ASUS Vivobook 15", "Go Laptop ASUS 15 Vivobook", "Go Laptop Vivobook ASUS 15", "Go Laptop Vivobook 15 ASUS", "Go Laptop 15 ASUS Vivobook", "Go Laptop 15 Vivobook ASUS", "Go Vivobook ASUS Laptop 15", "Go Vivobook ASUS 15 Laptop", "Go Vivobook Laptop ASUS 15", "Go Vivobook Laptop 15 ASUS", "Go Vivobook 15 ASUS Laptop", "Go Vivobook 15 Laptop ASUS", "Go 15 ASUS Laptop Vivobook", "Go 15 ASUS Vivobook Laptop", "Go 15 Laptop ASUS Vivobook", "Go 15 Laptop Vivobook ASUS", "Go 15 Vivobook ASUS Laptop", "Go 15 Vivobook Laptop ASUS", "15 ASUS Laptop Vivobook Go", "15 ASUS Laptop Go Vivobook", "15 ASUS Vivobook Laptop Go", "15 ASUS Vivobook Go Laptop", "15 ASUS Go Laptop Vivobook", "15 ASUS Go Vivobook Laptop", "15 Laptop ASUS Vivobook Go", "15 Laptop ASUS Go Vivobook", "15 Laptop Vivobook ASUS Go", "15 Laptop Vivobook Go ASUS", "15 Laptop Go ASUS Vivobook", "15 Laptop Go Vivobook ASUS", "15 Vivobook ASUS Laptop Go", "15 Vivobook ASUS Go Laptop", "15 Vivobook Laptop ASUS Go", "15 Vivobook Laptop Go ASUS", "15 Vivobook Go ASUS Laptop", "15 Vivobook Go Laptop ASUS", "15 Go ASUS Laptop Vivobook", "15 Go ASUS Vivobook Laptop", "15 Go Laptop ASUS Vivobook", "15 Go Laptop Vivobook ASUS", "15 Go Vivobook ASUS Laptop", "15 Go Vivobook Laptop ASUS" )
        $dell=@( "Dell", "Pro", "14", "Plus", "Dell Pro", "Dell 14", "Dell Plus", "Pro Dell", "Pro 14", "Pro Plus", "14 Dell", "14 Pro", "14 Plus", "Plus Dell", "Plus Pro", "Plus 14", "Dell Pro 14", "Dell Pro Plus", "Dell 14 Pro", "Dell 14 Plus", "Dell Plus Pro", "Dell Plus 14", "Pro Dell 14", "Pro Dell Plus", "Pro 14 Dell", "Pro 14 Plus", "Pro Plus Dell", "Pro Plus 14", "14 Dell Pro", "14 Dell Plus", "14 Pro Dell", "14 Pro Plus", "14 Plus Dell", "14 Plus Pro", "Plus Dell Pro", "Plus Dell 14", "Plus Pro Dell", "Plus Pro 14", "Plus 14 Dell", "Plus 14 Pro", "Dell Pro 14 Plus", "Dell Pro Plus 14", "Dell 14 Pro Plus", "Dell 14 Plus Pro", "Dell Plus Pro 14", "Dell Plus 14 Pro", "Pro Dell 14 Plus", "Pro Dell Plus 14", "Pro 14 Dell Plus", "Pro 14 Plus Dell", "Pro Plus Dell 14", "Pro Plus 14 Dell", "14 Dell Pro Plus", "14 Dell Plus Pro", "14 Pro Dell Plus", "14 Pro Plus Dell", "14 Plus Dell Pro", "14 Plus Pro Dell", "Plus Dell Pro 14", "Plus Dell 14 Pro", "Plus Pro Dell 14", "Plus Pro 14 Dell", "Plus 14 Dell Pro", "Plus 14 Pro Dell" )
        $thinkpad=@( "Lenovo", "ThinkPad", "T14", "Gen", "6", "Lenovo ThinkPad", "Lenovo T14", "Lenovo Gen", "Lenovo 6", "ThinkPad Lenovo", "ThinkPad T14", "ThinkPad Gen", "ThinkPad 6", "T14 Lenovo", "T14 ThinkPad", "T14 Gen", "T14 6", "Gen Lenovo", "Gen ThinkPad", "Gen T14", "Gen 6", "6 Lenovo", "6 ThinkPad", "6 T14", "6 Gen", "Lenovo ThinkPad T14", "Lenovo ThinkPad Gen", "Lenovo ThinkPad 6", "Lenovo T14 ThinkPad", "Lenovo T14 Gen", "Lenovo T14 6", "Lenovo Gen ThinkPad", "Lenovo Gen T14", "Lenovo Gen 6", "Lenovo 6 ThinkPad", "Lenovo 6 T14", "Lenovo 6 Gen", "ThinkPad Lenovo T14", "ThinkPad Lenovo Gen", "ThinkPad Lenovo 6", "ThinkPad T14 Lenovo", "ThinkPad T14 Gen", "ThinkPad T14 6", "ThinkPad Gen Lenovo", "ThinkPad Gen T14", "ThinkPad Gen 6", "ThinkPad 6 Lenovo", "ThinkPad 6 T14", "ThinkPad 6 Gen", "T14 Lenovo ThinkPad", "T14 Lenovo Gen", "T14 Lenovo 6", "T14 ThinkPad Lenovo", "T14 ThinkPad Gen", "T14 ThinkPad 6", "T14 Gen Lenovo", "T14 Gen ThinkPad", "T14 Gen 6", "T14 6 Lenovo", "T14 6 ThinkPad", "T14 6 Gen", "Gen Lenovo ThinkPad", "Gen Lenovo T14", "Gen Lenovo 6", "Gen ThinkPad Lenovo", "Gen ThinkPad T14", "Gen ThinkPad 6", "Gen T14 Lenovo", "Gen T14 ThinkPad", "Gen T14 6", "Gen 6 Lenovo", "Gen 6 ThinkPad", "Gen 6 T14", "6 Lenovo ThinkPad", "6 Lenovo T14", "6 Lenovo Gen", "6 ThinkPad Lenovo", "6 ThinkPad T14", "6 ThinkPad Gen", "6 T14 Lenovo", "6 T14 ThinkPad", "6 T14 Gen", "6 Gen Lenovo", "6 Gen ThinkPad", "6 Gen T14", "Lenovo ThinkPad T14 Gen", "Lenovo ThinkPad T14 6", "Lenovo ThinkPad Gen T14", "Lenovo ThinkPad Gen 6", "Lenovo ThinkPad 6 T14", "Lenovo ThinkPad 6 Gen", "Lenovo T14 ThinkPad Gen", "Lenovo T14 ThinkPad 6", "Lenovo T14 Gen ThinkPad", "Lenovo T14 Gen 6", "Lenovo T14 6 ThinkPad", "Lenovo T14 6 Gen", "Lenovo Gen ThinkPad T14", "Lenovo Gen ThinkPad 6", "Lenovo Gen T14 ThinkPad", "Lenovo Gen T14 6", "Lenovo Gen 6 ThinkPad", "Lenovo Gen 6 T14", "Lenovo 6 ThinkPad T14", "Lenovo 6 ThinkPad Gen", "Lenovo 6 T14 ThinkPad", "Lenovo 6 T14 Gen", "Lenovo 6 Gen ThinkPad", "Lenovo 6 Gen T14", "ThinkPad Lenovo T14 Gen", "ThinkPad Lenovo T14 6", "ThinkPad Lenovo Gen T14", "ThinkPad Lenovo Gen 6", "ThinkPad Lenovo 6 T14", "ThinkPad Lenovo 6 Gen", "ThinkPad T14 Lenovo Gen", "ThinkPad T14 Lenovo 6", "ThinkPad T14 Gen Lenovo", "ThinkPad T14 Gen 6", "ThinkPad T14 6 Lenovo", "ThinkPad T14 6 Gen", "ThinkPad Gen Lenovo T14", "ThinkPad Gen Lenovo 6", "ThinkPad Gen T14 Lenovo", "ThinkPad Gen T14 6", "ThinkPad Gen 6 Lenovo", "ThinkPad Gen 6 T14", "ThinkPad 6 Lenovo T14", "ThinkPad 6 Lenovo Gen", "ThinkPad 6 T14 Lenovo", "ThinkPad 6 T14 Gen", "ThinkPad 6 Gen Lenovo", "ThinkPad 6 Gen T14", "T14 Lenovo ThinkPad Gen", "T14 Lenovo ThinkPad 6", "T14 Lenovo Gen ThinkPad", "T14 Lenovo Gen 6", "T14 Lenovo 6 ThinkPad", "T14 Lenovo 6 Gen", "T14 ThinkPad Lenovo Gen", "T14 ThinkPad Lenovo 6", "T14 ThinkPad Gen Lenovo", "T14 ThinkPad Gen 6", "T14 ThinkPad 6 Lenovo", "T14 ThinkPad 6 Gen", "T14 Gen Lenovo ThinkPad", "T14 Gen Lenovo 6", "T14 Gen ThinkPad Lenovo", "T14 Gen ThinkPad 6", "T14 Gen 6 Lenovo", "T14 Gen 6 ThinkPad", "T14 6 Lenovo ThinkPad", "T14 6 Lenovo Gen", "T14 6 ThinkPad Lenovo", "T14 6 ThinkPad Gen", "T14 6 Gen Lenovo", "T14 6 Gen ThinkPad", "Gen Lenovo ThinkPad T14", "Gen Lenovo ThinkPad 6", "Gen Lenovo T14 ThinkPad", "Gen Lenovo T14 6", "Gen Lenovo 6 ThinkPad", "Gen Lenovo 6 T14", "Gen ThinkPad Lenovo T14", "Gen ThinkPad Lenovo 6", "Gen ThinkPad T14 Lenovo", "Gen ThinkPad T14 6", "Gen ThinkPad 6 Lenovo", "Gen ThinkPad 6 T14", "Gen T14 Lenovo ThinkPad", "Gen T14 Lenovo 6", "Gen T14 ThinkPad Lenovo", "Gen T14 ThinkPad 6", "Gen T14 6 Lenovo", "Gen T14 6 ThinkPad", "Gen 6 Lenovo ThinkPad", "Gen 6 Lenovo T14", "Gen 6 ThinkPad Lenovo", "Gen 6 ThinkPad T14", "Gen 6 T14 Lenovo", "Gen 6 T14 ThinkPad", "6 Lenovo ThinkPad T14", "6 Lenovo ThinkPad Gen", "6 Lenovo T14 ThinkPad", "6 Lenovo T14 Gen", "6 Lenovo Gen ThinkPad", "6 Lenovo Gen T14", "6 ThinkPad Lenovo T14", "6 ThinkPad Lenovo Gen", "6 ThinkPad T14 Lenovo", "6 ThinkPad T14 Gen", "6 ThinkPad Gen Lenovo", "6 ThinkPad Gen T14", "6 T14 Lenovo ThinkPad", "6 T14 Lenovo Gen", "6 T14 ThinkPad Lenovo", "6 T14 ThinkPad Gen", "6 T14 Gen Lenovo", "6 T14 Gen ThinkPad", "6 Gen Lenovo ThinkPad", "6 Gen Lenovo T14", "6 Gen ThinkPad Lenovo", "6 Gen ThinkPad T14", "6 Gen T14 Lenovo", "6 Gen T14 ThinkPad", "Lenovo ThinkPad T14 Gen 6", "Lenovo ThinkPad T14 6 Gen", "Lenovo ThinkPad Gen T14 6", "Lenovo ThinkPad Gen 6 T14", "Lenovo ThinkPad 6 T14 Gen", "Lenovo ThinkPad 6 Gen T14", "Lenovo T14 ThinkPad Gen 6", "Lenovo T14 ThinkPad 6 Gen", "Lenovo T14 Gen ThinkPad 6", "Lenovo T14 Gen 6 ThinkPad", "Lenovo T14 6 ThinkPad Gen", "Lenovo T14 6 Gen ThinkPad", "Lenovo Gen ThinkPad T14 6", "Lenovo Gen ThinkPad 6 T14", "Lenovo Gen T14 ThinkPad 6", "Lenovo Gen T14 6 ThinkPad", "Lenovo Gen 6 ThinkPad T14", "Lenovo Gen 6 T14 ThinkPad", "Lenovo 6 ThinkPad T14 Gen", "Lenovo 6 ThinkPad Gen T14", "Lenovo 6 T14 ThinkPad Gen", "Lenovo 6 T14 Gen ThinkPad", "Lenovo 6 Gen ThinkPad T14", "Lenovo 6 Gen T14 ThinkPad", "ThinkPad Lenovo T14 Gen 6", "ThinkPad Lenovo T14 6 Gen", "ThinkPad Lenovo Gen T14 6", "ThinkPad Lenovo Gen 6 T14", "ThinkPad Lenovo 6 T14 Gen", "ThinkPad Lenovo 6 Gen T14", "ThinkPad T14 Lenovo Gen 6", "ThinkPad T14 Lenovo 6 Gen", "ThinkPad T14 Gen Lenovo 6", "ThinkPad T14 Gen 6 Lenovo", "ThinkPad T14 6 Lenovo Gen", "ThinkPad T14 6 Gen Lenovo", "ThinkPad Gen Lenovo T14 6", "ThinkPad Gen Lenovo 6 T14", "ThinkPad Gen T14 Lenovo 6", "ThinkPad Gen T14 6 Lenovo", "ThinkPad Gen 6 Lenovo T14", "ThinkPad Gen 6 T14 Lenovo", "ThinkPad 6 Lenovo T14 Gen", "ThinkPad 6 Lenovo Gen T14", "ThinkPad 6 T14 Lenovo Gen", "ThinkPad 6 T14 Gen Lenovo", "ThinkPad 6 Gen Lenovo T14", "ThinkPad 6 Gen T14 Lenovo", "T14 Lenovo ThinkPad Gen 6", "T14 Lenovo ThinkPad 6 Gen", "T14 Lenovo Gen ThinkPad 6", "T14 Lenovo Gen 6 ThinkPad", "T14 Lenovo 6 ThinkPad Gen", "T14 Lenovo 6 Gen ThinkPad", "T14 ThinkPad Lenovo Gen 6", "T14 ThinkPad Lenovo 6 Gen", "T14 ThinkPad Gen Lenovo 6", "T14 ThinkPad Gen 6 Lenovo", "T14 ThinkPad 6 Lenovo Gen", "T14 ThinkPad 6 Gen Lenovo", "T14 Gen Lenovo ThinkPad 6", "T14 Gen Lenovo 6 ThinkPad", "T14 Gen ThinkPad Lenovo 6", "T14 Gen ThinkPad 6 Lenovo", "T14 Gen 6 Lenovo ThinkPad", "T14 Gen 6 ThinkPad Lenovo", "T14 6 Lenovo ThinkPad Gen", "T14 6 Lenovo Gen ThinkPad", "T14 6 ThinkPad Lenovo Gen", "T14 6 ThinkPad Gen Lenovo", "T14 6 Gen Lenovo ThinkPad", "T14 6 Gen ThinkPad Lenovo", "Gen Lenovo ThinkPad T14 6", "Gen Lenovo ThinkPad 6 T14", "Gen Lenovo T14 ThinkPad 6", "Gen Lenovo T14 6 ThinkPad", "Gen Lenovo 6 ThinkPad T14", "Gen Lenovo 6 T14 ThinkPad", "Gen ThinkPad Lenovo T14 6", "Gen ThinkPad Lenovo 6 T14", "Gen ThinkPad T14 Lenovo 6", "Gen ThinkPad T14 6 Lenovo", "Gen ThinkPad 6 Lenovo T14", "Gen ThinkPad 6 T14 Lenovo", "Gen T14 Lenovo ThinkPad 6", "Gen T14 Lenovo 6 ThinkPad", "Gen T14 ThinkPad Lenovo 6", "Gen T14 ThinkPad 6 Lenovo", "Gen T14 6 Lenovo ThinkPad", "Gen T14 6 ThinkPad Lenovo", "Gen 6 Lenovo ThinkPad T14", "Gen 6 Lenovo T14 ThinkPad", "Gen 6 ThinkPad Lenovo T14", "Gen 6 ThinkPad T14 Lenovo", "Gen 6 T14 Lenovo ThinkPad", "Gen 6 T14 ThinkPad Lenovo", "6 Lenovo ThinkPad T14 Gen", "6 Lenovo ThinkPad Gen T14", "6 Lenovo T14 ThinkPad Gen", "6 Lenovo T14 Gen ThinkPad", "6 Lenovo Gen ThinkPad T14", "6 Lenovo Gen T14 ThinkPad", "6 ThinkPad Lenovo T14 Gen", "6 ThinkPad Lenovo Gen T14", "6 ThinkPad T14 Lenovo Gen", "6 ThinkPad T14 Gen Lenovo", "6 ThinkPad Gen Lenovo T14", "6 ThinkPad Gen T14 Lenovo", "6 T14 Lenovo ThinkPad Gen", "6 T14 Lenovo Gen ThinkPad", "6 T14 ThinkPad Lenovo Gen", "6 T14 ThinkPad Gen Lenovo", "6 T14 Gen Lenovo ThinkPad", "6 T14 Gen ThinkPad Lenovo", "6 Gen Lenovo ThinkPad T14", "6 Gen Lenovo T14 ThinkPad", "6 Gen ThinkPad Lenovo T14", "6 Gen ThinkPad T14 Lenovo", "6 Gen T14 Lenovo ThinkPad", "6 Gen T14 ThinkPad Lenovo" )
        $panasonic=@( "Panasonic", "Toughbook", "CF-53", "Panasonic Toughbook", "Panasonic CF-53", "Toughbook Panasonic", "Toughbook CF-53", "CF-53 Panasonic", "CF-53 Toughbook", "Panasonic Toughbook CF-53", "Panasonic CF-53 Toughbook", "Toughbook Panasonic CF-53", "Toughbook CF-53 Panasonic", "CF-53 Panasonic Toughbook", "CF-53 Toughbook Panasonic" )
        $products=(Get-Content -Path "./db/products.json" | ConvertFrom-Json)
        if($search){
            if($search -in $asus){
                Write-PodeViewResponse -Path "store.pode" -Data @{
                    Products=$products
                    Cant=$products.cant
                    Post=""
                    id=1
                    Search=$search
                }
            }elseif($search -in $dell){
                Write-PodeViewResponse -Path "store.pode" -Data @{
                    Products=$products
                    Cant=$products.cant
                    Post=""
                    id=2
                    Search=$search
                }
            }elseif($search -in $thinkpad){
                Write-PodeViewResponse -Path "store.pode" -Data @{
                    Products=$products
                    Cant=$products.cant
                    Post=""
                    id=3
                    Search=$search
                }
            }
            elseif($search -in $panasonic){
                Write-PodeViewResponse -Path "store.pode" -Data @{
                    Products=$products
                    Cant=$products.cant
                    Post=""
                    id=4
                    Search=$search
                }
            }else{
                Write-PodeViewResponse -Path "store.pode" -Data @{
                    Products=$products
                    Cant=$products.cant
                    Post=""
                    id=0
                    Search=$search
                }
            }
        }else{
            Write-PodeViewResponse -Path "store.pode" -Data @{
                Products=$products
                Cant=$products.cant
                Post=""
                id=0.5
                Search=$search
            }
        }
    }

    #Funciones api-----------------
    Add-PodeRoute -Method Post -Path "/api/c_user" -ScriptBlock {
        $rol_u=$WebEvent.Data['rol_user']
        $id_u=$WebEvent.Data['id_user']
        $id_tu=$WebEvent.Data['id_tuser']
        $newname=$WebEvent.Data['new_name_user']
        $userData=(Get-Content -Path "./db/users.json" | ConvertFrom-Json)
        $userId=("487359"+$id_tu+"879312")
        if($userData.$userId){
            if($rol_u -eq "Admin_user"){
                $userData.$userId.username = $newname
                (ConvertTo-Json $userData) > ./db/users.json
                Move-PodeResponseUrl -Url "/my?id=$($id_u)&msg=Nombre%20de%20usuario%20cambiado"
            }else{
                if($id_u -eq $id_tu){
                    $userData.$userId.username = $newname
                    (ConvertTo-Json $userData) > ./db/users.json
                    Move-PodeResponseUrl -Url "/my?id=$($id_u)&msg=Nombre%20de%20usuario%20cambiado"
                }else{
                    Move-PodeResponseUrl -Url "/my?id=$($id_u)&msg=Debes%20ser%20Admin_user%20para%20cambiar%20el%20username%20de%20otro%20usuario%20que%20no%20seas%20tu"
                }
            }
        }else{
            Move-PodeResponseUrl -Url "/my?id=$($id_u)&msg=El%20usuario%20del%20id%20$($id_tu)%20no%20existe%20"
        }
    }

    Add-PodeRoute -Method Post -Path "/api/s_post" -ScriptBlock {
       $title=$WebEvent.Data['title_post']
       $content=$WebEvent.Data['content_post']
       $posts=(Get-Content -Path "./db/posts.json" | ConvertFrom-Json)
       $posts.cant=($posts.cant)+1
       $newPost=[PSCustomObject]@{
            title=$title
            content=$content
            date=Get-Date
       }
       $posts | Add-Member -MemberType NoteProperty -Name "$($posts.cant)" -Value $newPost
       (ConvertTo-Json $posts) > ./db/posts.json
       Move-PodeResponseUrl -Url "/blog"
    }

    Add-PodeRoute -Method Post -Path "/api/c_ai" -ScriptBlock {
       $content=$WebEvent.Data['content_submit']
       $chatDB=(Get-Content -Path "./db/chat.json" | ConvertFrom-Json)
       $userDB=(Get-Content -Path "./db/users.json" | ConvertFrom-Json)
       $chatDB.cant=($chatDB.cant)+1
       $newMessage=[PSCustomObject]@{
            user=$userDB."4873591879312".username
            text=$content
       }
       $chatDB | Add-Member -MemberType NoteProperty -Name "$($chatDB.cant)" -Value $newMessage
       $saludo=@("hola", "buenas", "saludos", "hello", "hi")
       $commands_d=@("command_descargar_log", "command_download_log", "command_download_log ", " command_download_log")
       $commands_c=@("command_clear", "command_cls", "command_limpiar", "command_clear ", " command_clear")
       if($content -in $saludo){
            $newRespuesta=[PSCustomObject]@{
                user="BugsAI"
                text="Hola :), en que puedo ayudarte?"
            }
        }elseif($content -in $commands_d) {
            (ConvertTo-Json $chatDB) > ./db/chat.json
            Move-PodeResponseUrl -Url "/log?file=bugsai.log"
            return $true
        }elseif($content -in $commands_c) {
            $chatDB=@{
                cant=1
                "1"=@{
                    user="BugsAI"
                    text="Saludame con un 'Hola' y te digo que puedo hacer XD"
                }
            }
            (ConvertTo-Json $chatDB) > ./db/chat.json
            "" > .\db\bugsai.log
            Move-PodeResponseUrl -Url "/bugsai"
            return $true
        }elseif($content.Substring(0, 8) -eq 'command_'){
            $cinj=($content -replace "command_","")
            $result= & $cinj
            $newRespuesta=[PSCustomObject]@{
                user="BugsAI"
                text=[string]$result
            }
        }else{
            $newRespuesta=[PSCustomObject]@{
                user="BugsAI"
                text="Lamento informarle que ocurrió un error en mi red neuronal. Escriba command_download_log para acceder al log o command_clear para reiniciar chat"
            }
            "$(Get-Date): Ha ocurrido un error en la red neuronal, el servidor estara en mantenimiento, solo funcionara los comandos command_download_log y command_clear" >> .\db\bugsai.log
        }
        $chatDB.cant=($chatDB.cant)+1
        $chatDB | Add-Member -MemberType NoteProperty -Name "$($chatDB.cant)" -Value $newRespuesta
       (ConvertTo-Json $chatDB) > ./db/chat.json
       Move-PodeResponseUrl -Url "/bugsai"
    }
    Write-Host "[+]HackMyBugs corriendo en el puerto 8001. Para cerrar pulse Ctrl+C"
}