module Admesh
  class Admesh
    class << self
      def help
        run(help: true)
      end

      private

      def run(args)
        exec "#{executable_path} #{format_args(args)}"
      end

      def executable_path
        file_directory = File.dirname(__FILE__)
        binary_path = File.join(file_directory, "..", "..", "ext", "admesh", "admesh", "admesh")
        File.absolute_path(binary_path)
      end

      def format_args(args)
        args.map do |key, value|
          if value == true
            "--#{key}"
          else
            "--#{key}=#{Shellwords.escape(value)}"
          end
        end.join(" ")
      end
    end
  end
end
