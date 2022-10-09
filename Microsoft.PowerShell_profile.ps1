# oh-my-posh init pwsh --config 'C:\Program Files (x86)\oh-my-posh\themes/lambdageneration.omp.json' | Invoke-Expression
oh-my-posh init pwsh --config 'C:\Program Files (x86)\oh-my-posh\themes/takuya.omp.json' | Invoke-Expression
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Import-Module -Name Terminal-Icons


#Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias l ls
Set-Alias v RunNvimLocal
Set-Alias n RunNvim
Set-Alias alexa RunAlexa
Set-Alias cc clear

function RunAlexa{
  python C:\Users\rosem\envDev\python\Alexa_Consummer_Api\main.py
}

function grep($param){
	$input | Select-String -Pattern ${param}
}

#Find in global history
function findh($param){
	cat (Get-PSReadlineOption).HistorySavePath | Select-String -Pattern ${param} | bat
}

function RunNvim($path) {
  nvim ${path}
}

function RunNvimLocal() {
  $curDir = Get-Location
  nvim $curDir
}

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
