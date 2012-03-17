Param($inputPaths = "svn_dump.txt", $importDir = ".\", $outputDir = ".\_SvnExport\", $replaceDirPart = "")
"------------------------------------------------------------------------------- "
" WARNING ouput paths may be wrong due too very weak implementation of replacing "
"------------------------------------------------------------------------------- "
"inputPaths Input Files: {0}" -f $inputPaths
"importDir Import Directory: {0}" -f $importDir
"outputDir output Directory: {0}" -f $outputDir
"replaceDirPart replaced part: {0}" -f $replaceDirPart

$paths = Get-Content $inputPaths
foreach($path in $paths){

	$inFile = $importDir + $path.replace($replaceDirPart,"").replace("/","\")
	$outFile = $outputDir + $path.replace($replaceDirPart,"").replace("/","\")
	
	#"in:{0} out:{1}" -f $inFile, $outFile
	
	New-Item -ItemType File -Path $outFile -Force
	Copy-Item $inFile $outFile -recurse
}
# input file:
# - Simple file containing svn log output (copy paste from TortoiseSVN)
# example usage:
# .\svn_dumper.ps1 -importDir "C:\xampp\htdocs\Project1\" -replaceDirPart "/Project1/trunk/"