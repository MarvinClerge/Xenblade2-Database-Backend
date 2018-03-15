require 'pp'
def parse_items1
  path =  File.dirname(__FILE__) + "/../Awesome.xlsx"
  data = Roo::Spreadsheet.open(path)

  sheet = data.sheets[6]
  row_count = data.last_row(sheet) + 1

  filter = [nil, "Item", "Instructions (Click Me)"]

  row_count.times do |i|
    row = data.row(i, sheet)

    if !filter.include?(row[0])
      p "Getting item1 information for #{row[0]}"

      item = {
        name: row[0],
        location: row[1],
        shop: row[2],
        first_effect: [
          row[3],
          row[4]
        ],
        second_effect: [
          row[5],
          row[6]
        ],
        third_effect: [
          row[7],
          row[8]
        ],
        category: row[9]
      }

      pouch = Pouch.find_or_create_by(name: item[:name])

      item.each do |key,value|
        pouch[key] = value
      end

      pouch.save
    end
  end
end
