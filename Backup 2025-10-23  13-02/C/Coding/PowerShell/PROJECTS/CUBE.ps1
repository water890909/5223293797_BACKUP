#screen dimension
$width = 80
$height = 40

#cube properties
$cubeWidth = 20
$distance = 100
$scale = 40

#rotation angles
$xAngle = 0
$yAngle = 0
$zAngle = 0

#rotation speeds
$xSpeed = 0.03
$ySpeed = 0.02
$zSpeed = 0.04

#8 vertices of the cube
$vertices = @(
    ,(-$cubeWidth, -$cubeWidth, -$cubeWidth)
    ,($cubeWidth, -$cubeWidth, -$cubeWidth)
    ,($cubeWidth,  $cubeWidth, -$cubeWidth)
    ,(-$cubeWidth,  $cubeWidth, -$cubeWidth)
    ,(-$cubeWidth, -$cubeWidth,  $cubeWidth)
    ,($cubeWidth, -$cubeWidth,  $cubeWidth)
    ,($cubeWidth,  $cubeWidth,  $cubeWidth)
    ,(-$cubeWidth,  $cubeWidth,  $cubeWidth)
) | ForEach-Object { [pscustomobject]@{X=$_[0]; Y=$_[1]; Z=$_[2]} }

#12 edges of the cube
$edges = @(
    @(0, 1), @(1, 2), @(2, 3), @(3, 0), 
    @(4, 5), @(5, 6), @(6, 7), @(7, 4), 
    @(0, 4), @(1, 5), @(2, 6), @(3, 7)  
)

function Draw-Line {
    param(
        [int]$x1, [int]$y1,
        [int]$x2, [int]$y2,
        [string]$char,
        [array]$buffer
    )

    $dx = [Math]::Abs($x2 - $x1)
    $dy = -[Math]::Abs($y2 - $y1)
    $sx = if ($x1 -lt $x2) { 1 } else { -1 }
    $sy = if ($y1 -lt $y2) { 1 } else { -1 }
    $err = $dx + $dy

    while ($true) {
        if ($x1 -ge 0 -and $x1 -lt $width -and $y1 -ge 0 -and $y1 -lt $height) {
            $buffer[$y1][$x1] = $char
        }

        if ($x1 -eq $x2 -and $y1 -eq $y2) { break }
        $e2 = 2 * $err
        if ($e2 -ge $dy) {
            if ($x1 -eq $x2) { break }
            $err += $dy
            $x1 += $sx
        }
        if ($e2 -le $dx) {
            if ($y1 -eq $y2) { break }
            $err += $dx
            $y1 += $sy
        }
    }
}

#animation loop (WHAT THE FUCK IS THIS)
try {
    Write-Host -NoNewline "$([char]27)[?25l"
    Clear-Host

    while ($true) {
        $buffer = for ($i = 0; $i -lt $height; $i++) { ,(' ' * $width).ToCharArray() }

        $sinX = [Math]::Sin($xAngle); $cosX = [Math]::Cos($xAngle)
        $sinY = [Math]::Sin($yAngle); $cosY = [Math]::Cos($yAngle)
        $sinZ = [Math]::Sin($zAngle); $cosZ = [Math]::Cos($zAngle)

        $projectedPoints = @{}

        for ($i = 0; $i -lt $vertices.Count; $i++) {
            $v = $vertices[$i]

            $x = $v.X * $cosY - $v.Z * $sinY
            $z = $v.X * $sinY + $v.Z * $cosY

            $y = $v.Y * $cosX - $z * $sinX
            $zFinal = $v.Y * $sinX + $z * $cosX

            $xFinal = $x * $cosZ - $y * $sinZ
            $yFinal = $x * $sinZ + $y * $cosZ

            $factor = $distance / ($distance - $zFinal)
            $projX = [int]($xFinal * $factor * $scale / 50 + $width / 2)
            $projY = [int]($yFinal * $factor * $scale / 100 + $height / 2)

            $projectedPoints[$i] = [pscustomobject]@{X=$projX; Y=$projY}
        }

        foreach ($edge in $edges) {
            $p1 = $projectedPoints[$edge[0]]
            $p2 = $projectedPoints[$edge[1]]
            Draw-Line $p1.X $p1.Y $p2.X $p2.Y '#' $buffer
        }

        Write-Host -NoNewline "$([char]27)[H"
        
        $buffer | ForEach-Object { $_ -join '' }

        $xAngle += $xSpeed
        $yAngle += $ySpeed
        $zAngle += $zSpeed

        Start-Sleep -Milliseconds 50
    }
}
finally {
    Write-Host -NoNewline "$([char]27)[?25h"
    Clear-Host
}