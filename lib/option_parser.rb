require 'optparse'

class Parser
  Options = Struct.new(:rows, :columns)
  private_constant :Options

  class << self
    def parse(args)
      option_parser = OptionParser.new do |parser|
        parser.banner = 'Usage: print_table_of_primes [OPTIONS]'

        parser.on('-r', '--rows=NUM_OF_ROWS', 'How many rows should prime table contain') do |rows|
          options.rows = rows.to_i
        end
        parser.on('-c', '--columns=NUM_OF_COLUMNS', 'How many columns should prime table contain') do |columns|
          options.columns = columns.to_i
        end
        parser.on('-h', '--help', 'Prints this help') do
          puts parser
          exit
        end
      end

      option_parser.parse!(args)
      options
    end

    private
    def options
      @options ||= Options.new(10, 10)
    end
  end
end