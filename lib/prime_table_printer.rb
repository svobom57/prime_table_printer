require 'terminal-table'

class PrimeTablePrinter

  attr_reader :options, :prime_generator

  def initialize(prime_generator, options)
    @prime_generator = prime_generator
    @options = options
  end

  def print
    puts Terminal::Table.new(headings: table_headings, rows: table_rows)
  end

  private
  def table_headings
    [' '] + columns
  end

  def table_rows
    rows.reduce([]) do |rows, row|
      line = []
      line << row
      columns.each do |column|
        line << cell(row, column)
      end
      rows << line
    end
  end

  def rows
    @rows ||= prime_generator.primes(options.rows)
  end

  def columns
    @columns ||= prime_generator.primes(options.columns)
  end

  def cell(row, column)
    row*column
  end
end