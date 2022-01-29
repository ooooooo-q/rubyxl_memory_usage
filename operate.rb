require 'rubyXL'

def write_xlsx
  if ENV['PATTERN'] == 'pattern1'

    workbook = RubyXL::Workbook.new
    worksheet = workbook[0]

    1000.times do |i|
      worksheet.add_cell(i, 0, 'xyz')
      worksheet.add_cell(i, 1, 'red')
      worksheet.add_cell(i, 2, 'blue')
      worksheet.add_cell(i, 3, 'green')
    end

    workbook.write("#{ENV['PATTERN']}.xlsx")

  elsif ENV['PATTERN'] == 'pattern2'

    require 'rubyXL/convenience_methods/font'
    require 'rubyXL/convenience_methods/cell'
    require 'rubyXL/convenience_methods/workbook'

    workbook = RubyXL::Workbook.new
    worksheet = workbook[0]

    1000.times do |i|
      cell = worksheet.add_cell(i, 0, 'xyz')
      cell.change_font_color('0f0f0f') if i % 10 == 0
      worksheet.add_cell(i, 1, 'red')
      worksheet.add_cell(i, 2, 'blue')
      worksheet.add_cell(i, 3, 'green')
    end

    workbook.write("#{ENV['PATTERN']}.xlsx")
  end
end

def read_xlsx
  if ENV['PATTERN'] == 'pattern1'
    workbook = RubyXL::Parser.parse("./pattern1.xlsx")
  elsif ENV['PATTERN'] == 'pattern2'
    workbook = RubyXL::Parser.parse("./pattern2.xlsx")
  end
end  
