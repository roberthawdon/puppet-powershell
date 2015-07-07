class powershellrunner (
  $environment    = $powershellrunner::params::environment,
  $psscriptfile   = $powershellrunner::params::psscriptfile,
  $powershellexe  = $powershellrunner::params::powershellexe,
  $psscriptpath   = $powershellrunner::params::psscriptpath,
  $psargs         = $powershellrunner::params::psargs,
  $source         = $powershellrunner::params::source,
  ) inherits powershellrunner::params {
  
      if ($osfamily == 'windows') and ($psscriptfile != undef) {
            file { 'importscript':
                  path => "$psscriptpath/$psscriptfile",
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
