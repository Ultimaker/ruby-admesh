require "shellwords"

class Admesh
  VERSION = "0.1.0"

  class << self
    def help
      run "#{executable_path} #{format_args(help: true)}"
    end

    def perform(file, options = {})
      run "#{executable_path} #{format_args(options)} #{file}"
    end

    private

    def executable_path
      binary_path = File.join(File.dirname(__FILE__), "..", "ext", "admesh", "admesh", "admesh")
      File.absolute_path(binary_path)
    end

    def format_args(args)
      args.map do |key, value|
        dasherized_key = key.to_s.gsub(/_/, "-")

        if value == true
          "--#{dasherized_key}"
        else
          "--#{dasherized_key}=#{Shellwords.escape(value)}"
        end
      end.join(" ")
    end

    def run(command)
      output = `#{command}`
      success = $?.to_i == 0
      success ? (return output) : (raise output)
    end
  end
end
