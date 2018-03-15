require 'roo'

def parse_blade1
  #Find the spreadsheet
  path =  File.dirname(__FILE__) + "/../Awesome.xlsx"
  data = Roo::Spreadsheet.open(path)

  sheet = data.sheets[2]
  row_count = data.last_row(sheet) + 1

  # Iterate through sheet 2
  row_count.times do |i|
    row = data.row(i, sheet)

    # Filter for rows to ignore
    filter = (0..3).to_a + (43..53).to_a + [20]

    if !filter.include?(i)
      p "Getting blade1 information for #{row[0]}"

      #Create the ActiveRecord associations
      pouch1 = Pouch.find_or_create_by(
        name: row[4],
        category: row[5],
        location: row[6]
      )

      pouch2 = Pouch.find_or_create_by(
        name: row[14],
        category: row[15],
        location: row[16]
      )

      blade =  Blade.find_or_create_by(
        name: row[0],
        element: row[1],
        role: row[2],
        weapon: row[3],
        pouch_categories: [
          row[9],
          row[10]
        ],
        field_skills: [
          row[11],
          row[12],
          row[13]
        ],
        obtained: row[19]
      )

      PouchBlade.find_or_create_by(
        pouch: pouch1,
        blade: blade
      )

      PouchBlade.find_or_create_by(
        pouch: pouch2,
        blade: blade
      )
    end # filter

  end # iteration

end # parse
