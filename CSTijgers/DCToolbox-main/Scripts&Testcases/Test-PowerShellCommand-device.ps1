# Test-PowerShellCommand-device.ps1
Describe "Test Command Output for Conditional Access Simulation" {
    It "should match the expected output from file" {
        # Path to the .txt file containing the original script
        $scriptPath = "D:\HBO-ICT\CST\project\command2device.txt"
        
        # Read the contents of the file and execute it
        $scriptContent = Get-Content -Path $scriptPath -Raw

        # Create a temporary file to capture the output (instead of using Write-Host)
        $outputFile = "D:\HBO-ICT\CST\project\test_output_device.txt"

        # Redirect the output of the script to a file
        Invoke-Expression -Command $scriptContent | Out-File -FilePath $outputFile -Force

        # Read the expected output from the expected output file
        $expectedOutputFile = "D:\HBO-ICT\CST\project\expected_output_device.txt"
        $expectedOutput = Get-Content -Path $expectedOutputFile -Raw

        # Read the actual output from the captured file
        $actualOutput = Get-Content -Path $outputFile -Raw

        # Compare the actual output to the expected output
        $actualOutput | Should -BeExactly $expectedOutput
    }
}
