# using assembly './Dumpify/Dumpify.dll'
if (-not ('Dumpify.DumpExtensions' -as [type])) {
	[string] $assemblyFilePath = Resolve-Path -Path "$PSScriptRoot/Dumpify/Dumpify.dll"
	Add-Type -Path $assemblyFilePath
}

function Out-Dump {
	[CmdletBinding()]
	[Alias('dumps')]
	Param (
		[Parameter(Mandatory = $true, ValueFromPipeline = $true, HelpMessage = 'The object to dump to the host.')]
		$InputObject,

		[Parameter(Mandatory = $false, HelpMessage = 'If provided, the object will be returned to the pipeline after being dumped.')]
		[switch] $PassThru
	)

	Process {
		# By default the Dump command also returns the $InputObject, so pipe it to $null to prevent that.
		[Dumpify.DumpExtensions]::Dump[Object]($InputObject) > $null

		if ($PassThru) {
			$InputObject
		}
	}
}
