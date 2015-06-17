require 'seqtkrb/version'
require 'seqtkrb/cmd'
require 'bindeps'
require 'fixwhich'

module Seqtk

  class Seqtk

    include Which

    def initialize

      # check seqtk is installed - install it if not
      gem_dir = Gem.loaded_specs['seqtkrb'].full_gem_path
      gem_deps = File.join(gem_dir, 'deps.yaml')
      Bindeps.require gem_deps

      missing = Bindeps.missing gem_deps
      unless missing.empty?
        raise StandardError.new('seqtk was not found and ' +
                                'could not be installed')
      end

      @bin = which('seqtk').first

    end

    def run cmd

      task = Cmd.new "#{@bin} #{cmd}"
      task.run

      unless task.status.success?
        msg = "seqtk command #{cmd} failed\n"
        msg << "stdout:\n"
        msg << task.stdout
        msg << "\nstderr:\n"
        msg << task.stderr
        raise StandardError.new(msg)
      end

    end

  end

end

require 'seqtkrb/sample'
