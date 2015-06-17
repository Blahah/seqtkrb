module Seqtk

  class Seqtk

    def sample(infile, outfile, n, seed=-1)
      run "sample #{seedstr seed} #{infile} #{n} > #{outfile}"
    end

    def sample_lowmem(infile, outfile, n, seed=-1)
      run "sample -2 #{seedstr seed} #{infile} #{n} > #{outfile}"
    end

    def seedstr seed
      seed == -1 ? "" : "-s #{seed}"
    end

  end

end
