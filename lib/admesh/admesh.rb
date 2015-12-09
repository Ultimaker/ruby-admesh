module Admesh
  class Admesh
    class << self
      def help
        run(help: true)
      end

      private

      def run(args)
        formatted_arg_pairs = args.map do |key, value|
          if value == true
            "--#{key}"
          else
            "--#{key}=#{Shellwords.escape(value)}"
          end
        end

        file_directory = File.dirname(__FILE__)
        executable = File.join(file_directory, "..", "..", "ext", "admesh", "admesh", "admesh")
        exec "#{File.absolute_path(executable)} #{formatted_arg_pairs.join(' ')}"
      end
    end
  end
end
