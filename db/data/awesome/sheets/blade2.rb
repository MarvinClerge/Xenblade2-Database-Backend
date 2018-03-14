require 'roo'

def parse_blade2
  path =  File.dirname(__FILE__) + "/../Awesome.xlsx"
  data = Roo::Spreadsheet.open(path)

  sheet = data.sheets[3]
  row_count = data.last_row(sheet) + 1

  filter = ["NG+", "Blade", "Note"]

  row_count.times do |i|
    row = data.row(i, sheet)

    if row[0] && !filter.include?(row[0])
      stats = {
        name: row[0],
        aux_cores: row[4],
        modifier_stat: row[5],
        modifier_value: row[6],
        physical_defense: row[7],
        ether_defense: row[8]
      }

      blade = Blade.find_by(name: stats[:name])

      stats.each do |key,value|
        blade[key] = value
      end

      blade.save
    end
  end

end
