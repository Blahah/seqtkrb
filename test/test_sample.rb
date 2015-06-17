require 'helper'

class TestSample < Test::Unit::TestCase

  context 'seqtk' do

    setup do
      @seq = Seqtk::Seqtk.new
      @l = File.join(File.dirname(__FILE__), "data", "l.fq")
      @r = File.join(File.dirname(__FILE__), "data", "r.fq")
    end

    should 'sample n reads from a file' do
      Dir.mktmpdir do |dir|
        Dir.chdir dir do
          [2, 10, 50].each do |n|
            @seq.sample(@l, 'sample.fq', n)
            n_sampled = `wc -l sample.fq`.chomp.to_i / 4
            assert_equal n, n_sampled, "#{`head sample.fq`}"
          end
        end
      end
    end

    should 'sample frac proportion of a file' do
      Dir.mktmpdir do |dir|

        Dir.chdir dir do
          [0.1, 0.2, 0.5].each do |frac|
            @seq.sample(@l, 'sample.fq', frac, 1234)
            n_sampled = `wc -l sample.fq`.chomp.to_i / 4
            frac_sampled = n_sampled / 150.0
            assert_in_delta frac, frac_sampled, 0.3
          end
        end
      end
    end

    should 'sample n reads with seed' do
      Dir.mktmpdir do |dir|
        Dir.chdir dir do
          seed = 1234
          [2, 10, 50].each do |n|
            @seq.sample(@l, 'sample_l.fq', n, seed)
            @seq.sample(@r, 'sample_r.fq', n, seed)
            l_sampled = `wc -l sample_l.fq`.chomp.to_i / 4
            r_sampled = `wc -l sample_r.fq`.chomp.to_i / 4
            assert_equal l_sampled, r_sampled
          end
        end
      end
    end

    should 'sample with low memory' do
      Dir.mktmpdir do |dir|
        Dir.chdir dir do
          n = 100
          @seq.sample_lowmem(@l, 'sample.fq', n)
          n_sampled = `wc -l sample.fq`.chomp.to_i / 4
          assert_equal n, n_sampled
        end
      end
    end

  end

end
