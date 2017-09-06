require_relative '../lib/prime_table_printer'

RSpec.describe PrimeTablePrinter do
  let(:prime_generator) { double(:prime_generator, primes: [2, 3]) }
  let(:options) { double(:options, rows: 2, columns: 2) }

  describe '#print' do
    it 'prints prime multiplication table' do
      table_printer = PrimeTablePrinter.new(prime_generator, options)
      terminal_table = double(:terminal_table)
      allow(Terminal::Table).to receive(:new).and_return(terminal_table)

      expect(STDOUT).to receive(:puts).with(terminal_table)

      table_printer.print
    end
  end

  describe '#heading' do
    it 'returns table heading for two columns' do
      table_printer = PrimeTablePrinter.new(prime_generator, options)

      expect(table_printer.send(:table_headings)).to eq [' ', 2, 3]
    end
  end

  describe '#rows' do
    it 'returns table rows' do
      table_printer = PrimeTablePrinter.new(prime_generator, options)

      expect(table_printer.send(:table_rows)).to eq [[2, 4, 6], [3, 6, 9]]
    end
  end
end