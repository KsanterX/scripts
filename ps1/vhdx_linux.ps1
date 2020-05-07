param (
    [string]$path="",
    [string]$diskname="linuxdisk.vhdx",
    $size=127GB
)

function MainFunction {
if (checkPath) {
    if (-Not (checkDisk)) {
        createDisk
        exit
    } else {
        yesnoSelector
    }
} else {
mkdir
MainFunction
}
}

function mkdir {
New-Item -ItemType Directory -Force -Path $path
}

function checkDisk {
Test-Path $fullpath -PathType Leaf
}

function checkPath {
  Test-Path $path -PathType Container
}

function yesnoSelector {
errors(1)
$Readhost = Read-Host "( y / n )"
Switch ($Readhost)
{
Y {Remove-Item $fullpath; createDisk; exit}
N {exit}
}
}

function createDisk {
New-VHD -Path $fullpath -SizeBytes $size -Dynamic -BlockSizeBytes 1MB
}

function errors ($code) {
switch ($code)
{
0 {
    'Please specify or edit the folder $path with optional $diskname (linuxdisk.vhdx) and $size (127GB)'
}
1 {
    'Attention!!! Disk with this name already exists. Overwrite?'
}
}
}

If ($path -ne '') {
$fullpath = (Join-Path $path $diskname)
MainFunction
} else {
errors(0)
}
