using module './dumPS.psm1'

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
