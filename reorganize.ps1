$root = "c:\Users\rajah\Website Operations\studioBOSE Site\images"

# Create subfolders
$folders = @(
  "projects\yey-salon",
  "projects\odd-facades",
  "projects\mountain-casita",
  "projects\lorenzo-lane-redux",
  "projects\jewel-box",
  "projects\orchard-casita",
  "projects\treehouse-module",
  "projects\food-to-power-headquarters",
  "projects\burning-man-dinosaur-head",
  "projects\ai-powered-mood-boards",
  "team",
  "technology"
)
foreach ($f in $folders) {
  New-Item -ItemType Directory -Path "$root\$f" -Force | Out-Null
}

# Move project images
Get-ChildItem "$root\yey-salon-*"          | Move-Item -Destination "$root\projects\yey-salon\"
Get-ChildItem "$root\odd-facades-*"        | Move-Item -Destination "$root\projects\odd-facades\"
Get-ChildItem "$root\mountain-casita-*"    | Move-Item -Destination "$root\projects\mountain-casita\"
Get-ChildItem "$root\lorenzo-lane-redux-*" | Move-Item -Destination "$root\projects\lorenzo-lane-redux\"
Get-ChildItem "$root\jewel-box-*"          | Move-Item -Destination "$root\projects\jewel-box\"
Get-ChildItem "$root\orchard-casita-*"     | Move-Item -Destination "$root\projects\orchard-casita\"
Get-ChildItem "$root\treehouse-module-*"   | Move-Item -Destination "$root\projects\treehouse-module\"
Get-ChildItem "$root\food-to-power-*"      | Move-Item -Destination "$root\projects\food-to-power-headquarters\"
Get-ChildItem "$root\burning-man-*"        | Move-Item -Destination "$root\projects\burning-man-dinosaur-head\"
Get-ChildItem "$root\ai-powered-*"         | Move-Item -Destination "$root\projects\ai-powered-mood-boards\"

# Move team images
Get-ChildItem "$root\team-*"               | Move-Item -Destination "$root\team\"

# Move technology images
Get-ChildItem "$root\technology-*"         | Move-Item -Destination "$root\technology\"

Write-Host "All files moved successfully."
