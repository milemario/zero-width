function Convert-ToBinaryZeroWidth {
    param(
        [Parameter(Mandatory=$true)]
        [string]$InputText
    )

    $binaryString = ""
    
    # Convert each character to binary
    foreach ($char in $InputText.ToCharArray()) {
        $binaryCode = [Convert]::ToString([char]$char, 2).PadLeft(8, '0')
        $binaryString += $binaryCode
    }

    # Replace 0 and 1 with zero-width characters
    $binaryString = $binaryString.Replace('0', [char]0x200B).Replace('1', [char]0x200C)

    return $binaryString
}

# Example usage:
$text = "Hello"
$zeroWidthBinary = Convert-ToBinaryZeroWidth -InputText $text
Write-Output "Original Text: $text"
Write-Output "Zero-Width Binary: $zeroWidthBinary"
