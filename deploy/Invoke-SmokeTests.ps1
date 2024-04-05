# These tests are runs as part of the deployment process to ensure the newly published module is working as expected.
# These tests run against the installed module, not the source code, so they are a real-world test and should not use mocks.
# Since mocks are not used, be careful to not rely on state stored on the machine, such as a module configuration file.
# This is a great place to put tests that differ between operating systems, since they will be ran on multiple platforms.
# To run these tests on your local machine, see the comments in the BeforeAll block.

BeforeAll {
	Import-Module -Name 'dumPS' -Force

	# To run these tests on your local machine, comment out the Import-Module command above and uncomment the one below.
	# 	Do this to use the module version from source code, not the installed version.
	# 	This is necessary to test functionality that you've added to the module, but have not yet published and installed.
	# Import-Module "$PSScriptRoot\..\src\dumPS" -Force
}

Describe 'Using Out-Dump' {
	It 'Should not return any output by default' {
		$obj = @{
			Name = 'Daniel Schroeder'
			Address = @{
				Province = 'Saskatchewan'
				Country = 'Canada'
			}
		}

		$result = Out-Dump -InputObject $obj
		$result | Should -BeNull
	}

	It 'Should return the object when -PassThru is used' {
		$obj = @{
			Name = 'Daniel Schroeder'
			Address = @{
				Province = 'Saskatchewan'
				Country = 'Canada'
			}
		}

		$result = Out-Dump -InputObject $obj -PassThru
		$result | Should -Be $obj
	}

	It 'Should return the object when -PassThru is used with the alias dumps' {
		$obj = @{
			Name = 'Daniel Schroeder'
			Address = @{
				Province = 'Saskatchewan'
				Country = 'Canada'
			}
		}

		$result = dumps $obj -PassThru
		$result | Should -Be $obj
	}

	It 'Should allow piping objects to it' {
		$obj = @{
			Name = 'Daniel Schroeder'
			Address = @{
				Province = 'Saskatchewan'
				Country = 'Canada'
			}
		}

		$obj | Out-Dump | Should -BeNull
	}

	It 'Should allow piping objects to it with the alias dumps' {
		$obj = @{
			Name = 'Daniel Schroeder'
			Address = @{
				Province = 'Saskatchewan'
				Country = 'Canada'
			}
		}

		$obj | dumps | Should -BeNull
	}

	It 'Should allow piping objects to it and return the object when -PassThru is used' {
		$obj = @{
			Name = 'Daniel Schroeder'
			Address = @{
				Province = 'Saskatchewan'
				Country = 'Canada'
			}
		}

		$obj | Out-Dump -PassThru | Should -Be $obj
	}
}
