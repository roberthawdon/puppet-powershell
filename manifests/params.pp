class powershellrunner::params () {
  
  $environment    = $::environment
  $psscriptfile   = undef
  $powershellexe  = 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe'
  $psscriptpath   = "C:/Windows/Temp/${psscriptfile}"
  $psargs         = undef
  $source         = undef

}

