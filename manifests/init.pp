class powershellrunner (
  $environment    = $puppetpowershell::params::environment,
  $psscriptfile   = $puppetpowershell::params::psscriptfile,
  $powershellexe  = $puppetpowershell::params::powershellexe,
  $psscriptpath   = $puppetpowershell::params::psscriptpath,
  $psargs         = $puppetpowershell::params::psargs,
  $source         = $puppetpowershell::params::source,
  ) inherits powershellrunner::params {
  
      if ($osfamily == 'windows') and ($psscriptfile != undef) {
            file { 'importscript':
                  path => "$psscriptpath",
                  ensure => "file",
                  source => "$source",
                  notify => Exec['psscript']
            }
            
            exec { 'psscript':
                  refreshonly => true,
                  command     => "start-process -verb runas $powershellexe -argumentlist '-file ${psscriptpath}/${psscriptfile} ${psargs}'",
                  provider    => "powershell"
            }
      }
}
