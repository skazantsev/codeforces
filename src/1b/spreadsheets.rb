# http://codeforces.com/problemset/problem/1/B

class SpreadsheetCoordinateConverter
  EXCEL_SYSTEM_BASE = 26

  class << self
    def convert(lines)
      lines.map do |line|
        if line =~ /R(\d+)C(\d+)/
          rc_to_excel($1.to_i, $2.to_i)
        elsif line =~ /([A-Z]+)(\d+)/
          excel_to_rc($1.to_s, $2.to_i)
        end
      end
    end

    private

    # R23C55 -> BC23
    def rc_to_excel(row, col)
      excel_col = ''
      while col > 0
        col -= 1
        excel_col << num_to_chr(col % EXCEL_SYSTEM_BASE)
        col /= EXCEL_SYSTEM_BASE
      end
      excel_col.reverse! + row.to_s
    end

    # BC23 -> R23C55
    def excel_to_rc(excel_col, row)
      col = 0
      power_multiplier = 1
      excel_col.reverse.each_char do |chr|
        col += (chr_to_num(chr) + 1) * power_multiplier
        power_multiplier *= EXCEL_SYSTEM_BASE
      end
      "R#{row}C#{col}"
    end

    def num_to_chr(num)
      (num + 'A'.ord).chr
    end

    def chr_to_num(chr)
      chr.ord - 'A'.ord
    end
  end
end

if __FILE__ == $0
  lineCount = gets.to_i
  lines = []
  lineCount.times { |line| lines << gets }
  SpreadsheetCoordinateConverter.convert(lines).each { |line| puts line }
end
