module Admesh
  class Admesh
    class << self
      def help
        exec "#{executable_path} #{format_args(help: true)}"
      end

      def perform(file, options = {})
        exec "#{executable_path} #{format_args(options)} #{file}"
      end

      private

      def executable_path
        file_directory = File.dirname(__FILE__)
        binary_path = File.join(file_directory, "..", "..", "ext", "admesh", "admesh", "admesh")
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
    end
  end
end
