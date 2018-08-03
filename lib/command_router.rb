require 'set'
require_relative 'arg_handler'
module Cpm
  class CommandRouter
    def args
      @args
    end
    def initialize argv
      @args = ArgHandler.new argv
    end
    def self.route argv
      command_router = CommandRouter.new argv
      command_router.dispatch
    end
    def dispatch
      Dir[File.join(__dir__, 'commands', '*.rb')].each do |file|
        if args.include? (File.basename(file)[0..-4])
          require file
        end
      end
      commands = Set.new(Commands.constants.map(&Commands.method(:const_get)).grep(Class))
      commands.each do |cmd|
        cmd.new(args).run
      end
    end
  end
end
