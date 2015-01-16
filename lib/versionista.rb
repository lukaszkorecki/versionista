require 'versionista/version'

require 'optparse'
require 'logger'

module Versionista
  def self.from_args(args)
    options = {}

    optparse = OptionParser.new do |opts|
      opts.banner = <<-EOF
      Versionista!


      Manage version files. To get started run

        versionista --init --version-file ./path/to/File
      EOF
      opts.on('--version-file FILE', 'Path to version file') do |file|
        options[:file] = File.expand_path(file)
      end

      opts.on('--bump WHICH', 'Bump: major/minor/patch') do |which|
        options[:which] = which
      end

      opts.on('--init', 'Initialize version file') do
        options[:init] = true
      end

      opts.on('-h', 'halp') do
        puts opts
        exit 0
      end
    end

    optparse.parse! args

    if options.empty?
      puts optparse
      exit 0
    end

    Manager.new(options[:init], options[:file], options[:which])
  end

  class Manager < Struct.new(:init, :file, :which)
    def run
      abort 'No file' if !file || (!File.exist?(file)  && !init)
      abort "Wrong specifier: #{which}" unless  (%w(minor major patch).include? which) || init
      if init
        log.info "Initializing #{file} with version: 1.0.0"
        File.write(file, '1.0.0')
        exit 0
      end

      bump!(which)
    end

    def bump!(which)
      current_version = File.read(file).strip.chomp

      version_hash = Hash[%w(major minor patch).zip(current_version.split('.').map(&:to_i))]

      version_hash[which] += 1

      next_version = version_hash.values.join('.')

      log.info "Moving from #{current_version} to #{next_version} (in #{file})"
      File.write(file, next_version)
      log.info 'Done'
    end

    def log
      @log ||= Logger.new(STDERR).tap do |l|
        l.formatter = Logger::Formatter.new
      end
    end
  end
end
