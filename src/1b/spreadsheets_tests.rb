require_relative 'spreadsheets.rb'
require 'test/unit'

class SpreadsheetCoordinateConverterTests < Test::Unit::TestCase
  test 'example' do
    result = SpreadsheetCoordinateConverter.convert(['R23C55', 'BC23'])
    assert_equal(['BC23', 'R23C55'], result)
  end

  test 'excel coordinates starting from R' do
    result = SpreadsheetCoordinateConverter.convert(['R1'])
    assert_equal(['R1C18'], result)
  end
end
