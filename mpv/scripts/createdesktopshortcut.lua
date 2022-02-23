local function createDesktopShortcut()
  local video_path = mp.get_property("path")
  local filename = mp.get_property("filename")

  local shortcut_name = filename .. ".lnk"

  local ps = io.popen("powershell -windowstyle hidden -command -", "w")
  ps:write("$DesktopPath = [Environment]::GetFolderPath('Desktop');$FullPath = (-join($DesktopPath, "\", "..shortcut_name.."));$ws = New-Object -ComObject WScript.Shell;$s = $ws.CreateShortcut($FullPath);$s.TargetPath = '"..video_path.."';$s.Save()")
  ps:close()
end

mp.add_key_binding("shift+s", createDesktopShortcut)
