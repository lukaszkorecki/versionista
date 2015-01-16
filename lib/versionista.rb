require 'versionista/version'

require 'optparse'
require 'logger'

module Versionista
  def self.from_args(args)
    options = {}

    optparse = OptionParser.new do |opts|
      opts.on('--version-file FILE', 'Path to version file') do |file|
        options[:file] = File.expand_path(file)
      end

      opts.on('--bump WHICH', 'Bump: major/minor/patch') do |which|
        options[:which] = which
      end

      opts.on('--init', 'Initialize version file') do
        options[:init] = true
      end
    end

    optparse.parse! args

    Manager.new(options[:init], options[:file], options[:which])
  end

  class Manager < Struct.new(:init, :file, :which)
    def run
      if init
        log.info "Initializing #{file} with version: 1.0.0"
        File.write(file, '1.0.0')
        exit 0
      end

      bump!(which)
    end

    def bump! which
      current_version = File.read(file).strip.chomp

      version_hash = Hash[%w(major minor patch).zip(current_version.split('.').map(&:to_i))]

      version_hash[which] += 1

      next_version = version_hash.values.join('.')

      log.info "Moving from #{current_version} to #{next_version} (in #{file})"
      File.write(file, next_version)
      log.info "Done"
    end

    def log
      @log ||= Logger.new(STDERR).tap do |l|
        l.formatter = Logger::Formatter.new
      end
    end
  end
end
