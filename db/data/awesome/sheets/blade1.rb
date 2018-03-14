require 'roo'

def parse_blade1
  path =  File.dirname(__FILE__) + "/../Awesome.xlsx"
  data = Roo::Spreadsheet.open(path)

  (data.last_row(data.sheets[2]) + 1).times do |i|

    blade =  Blade.new(
      name: data.row(i, data.sheets[2])[0],
      element: data.row(i, data.sheets[2])[1],
      role: data.row(i, data.sheets[2])[2],
      weapon: data.row(i, data.sheets[2])[3],
      pouch_items: [
        data.row(i, data.sheets[2])[4],
        data.row(i, data.sheets[2])[14],
      ],
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

    # favorite_pouch_items: [
    #   {
    #     name: data.row(i, data.sheets[2])[4],
    #     category: data.row(i, data.sheets[2])[5],
    #     location: data.row(i, data.sheets[2])[6]
    #   },{
    #     name: data.row(i, data.sheets[2])[14],
    #     category: data.row(i, data.sheets[2])[15],
    #     location: data.row(i, data.sheets[2])[16]
    #   }
    # ]

    p blade
    p "-"*100
  end

end
