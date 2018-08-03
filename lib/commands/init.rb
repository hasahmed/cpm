module Cpm
  module Commands
    class Init
      def initialize args
        @args = args
      end
      def args
        @args
      end
      def help_str
        cpm init []
      end
      def makefile_c
        FileUtils.cp(File.join(File.expand_path(File.dirname(__FILE__)), '../../assets', 'cpp', 'Makefile'), FileUtils.pwd)
      end
      def makefile_cpp
        FileUtils.cp(File.join(File.expand_path(File.dirname(__FILE__)), '../../assets', 'c', 'Makefile'), FileUtils.pwd)
      end

      def run
        if args.include? '++'
          makefile_cpp
        else
          makefile_c
        end
      end

    end
  end
end
