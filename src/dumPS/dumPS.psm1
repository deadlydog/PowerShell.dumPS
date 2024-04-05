# using assembly './Dumpify/Dumpify.dll'
if (-not ('Dumpify.DumpExtensions' -as [type])) {
	[string] $assemblyFilePath = Resolve-Path -Path "$PSScriptRoot/Dumpify/Dumpify.dll"
	Add-Type -Path $assemblyFilePath
}

function Out-Dumps {
	[CmdletBinding()]
	[Alias('dumps')]
	Param (
		[Parameter(Mandatory = $true, ValueFromPipeline = $true, HelpMessage = 'The object to dump to the host.')]
		$InputObject,

		[Parameter(Mandatory = $false, HelpMessage = 'If provided, the object will be returned to the pipeline after being dumped.')]
		[switch] $PassThru
	)

	[Dumpify.DumpExtensions]::Dump[Object]($InputObject) > $null

	if ($PassThru) {
		$InputObject
	}
}
