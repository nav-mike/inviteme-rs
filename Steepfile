# D = Steep::Diagnostic

target :app do
  signature "sig"

  # check "lib"                       # Directory name
  check "app/models/**/*.rb"        # Glob
  # ignore "lib/templates/*.rb"

  library "pathname"       # Standard libraries
  # library "strong_json"           # Gems

  library "mutex_m"
  library "logger"
  library "singleton"
  library "monitor"
  library "tsort"
  library "tempfile"
  library "time"
  library "date"

  repo_path "vendor/rbs/gem_rbs_collection/gems"

  library "activerecord"
  library "activemodel"
  library "activesupport"
  library "activestorage"
  library "rack"
  library "railties"
  library "ast"
  library "actionpack"
  library "actionview"
  library "activejob"

  # configure_code_diagnostics(D::Ruby.strict)       # `strict` diagnostics setting
  # configure_code_diagnostics(D::Ruby.lenient)      # `lenient` diagnostics setting
  # configure_code_diagnostics do |hash|             # You can setup everything yourself
  #   hash[D::Ruby::NoMethod] = :information
  # end
end

# target :test do
#   signature "sig", "sig-private"
#
#   check "test"
#
#   # library "pathname", "set"       # Standard libraries
# end
