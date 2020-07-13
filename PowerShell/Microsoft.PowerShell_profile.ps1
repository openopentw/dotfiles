# better ls
function l {
	dir | Format-Wide -Column 5
}

# better cd
function c ([String] $location) {
	cd $location
	dir | Format-Wide -Column 5
	$pwd.path | Out-File ~\_last_position
}

# start-up location
if ($pwd.path -eq "C:\WINDOWS\system32") {
	$last_position = Get-Content C:\Users\YJC\_last_position
	c $last_position
}

# hotspot
function Hotspot-Start () {
	netsh wlan start hostednetwork
}

function Hotspot-Stop () {
	netsh wlan stop hostednetwork
}

Set-Alias -Name p -Value python
Set-Alias -Name ip -Value ipython
