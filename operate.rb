# frozen_string_literal: true

require 'rubyXL'

def write_xlsx(pattern)
  if pattern == 'pattern1'

    workbook = RubyXL::Workbook.new
    worksheet = workbook[0]

    1000.times do |i|
      worksheet.add_cell(i, 0, 'xyz')
      worksheet.add_cell(i, 1, 'red')
      worksheet.add_cell(i, 2, 'blue')
      worksheet.add_cell(i, 3, 'green')
    end

    workbook.write("#{pattern}.xlsx")

  elsif pattern == 'pattern2'

    require 'rubyXL/convenience_methods/font'
    require 'rubyXL/convenience_methods/cell'
    require 'rubyXL/convenience_methods/workbook'

    workbook = RubyXL::Workbook.new
    worksheet = workbook[0]

    1000.times do |i|
      cell = worksheet.add_cell(i, 0, 'xyz')
      cell.change_font_color('0f0f0f') if i % 5 == 0
      worksheet.add_cell(i, 1, 'red')
      worksheet.add_cell(i, 2, 'blue')
      worksheet.add_cell(i, 3, 'green')
    end

    workbook.write("#{pattern}.xlsx")
  end
end

def read_xlsx(pattern)
  workbook = RubyXL::Parser.parse("./#{pattern}.xlsx")
end  
