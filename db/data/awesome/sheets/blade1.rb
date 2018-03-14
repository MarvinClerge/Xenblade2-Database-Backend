require 'roo'

def parse_blade1
  #Find the spreadsheet
  path =  File.dirname(__FILE__) + "/../Awesome.xlsx"
  data = Roo::Spreadsheet.open(path)

  # Iterate through sheet 2
  (data.last_row(data.sheets[2]) + 1).times do |i|
    # Filter for rows to ignore
    filter = (0..3).to_a + (43..53).to_a

    if !filter.include?(i)
      #Create the ActiveRecord associations
      pouch1 = Pouch.find_or_create_by(
        name: data.row(i, data.sheets[2])[4],
        category: data.row(i, data.sheets[2])[5],
        location: data.row(i, data.sheets[2])[6]
      )

      pouch2 = Pouch.find_or_create_by(
        name: data.row(i, data.sheets[2])[14],
        category: data.row(i, data.sheets[2])[15],
        location: data.row(i, data.sheets[2])[16]
      )

      blade =  Blade.find_or_create_by(
        name: data.row(i, data.sheets[2])[0],
        element: data.row(i, data.sheets[2])[1],
        role: data.row(i, data.sheets[2])[2],
        weapon: data.row(i, data.sheets[2])[3],
        pouch_categories: [
          data.row(i, data.sheets[2])[9],
          data.row(i, data.sheets[2])[10]
        ],
        field_skills: [
          data.row(i, data.sheets[2])[11],
          data.row(i, data.sheets[2])[12],
          data.row(i, data.sheets[2])[13]
        ],
        obtained: data.row(i, data.sheets[2])[19]
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
