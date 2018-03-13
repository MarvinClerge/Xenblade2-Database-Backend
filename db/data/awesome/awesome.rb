require 'csv'
require 'roo'
require 'pp'
require 'pry'

x = Roo::Spreadsheet.open('./data/Awesome.xlsx')
# p x.sheets[2]
# p x.row(x.last_row, x.sheets[2])
(x.last_row(x.sheets[2]) + 1).times do |i|
  if i > 3
    blade = {
      name: x.row(i, x.sheets[2])[0],
      element: x.row(i, x.sheets[2])[1],
      role: x.row(i, x.sheets[2])[2],
      weapon: x.row(i, x.sheets[2])[3],
      pouch_items: {
        favorites: [
          {
            name: x.row(i, x.sheets[2])[4],
            category: x.row(i, x.sheets[2])[5],
            location: x.row(i, x.sheets[2])[6]
          },{
            name: x.row(i, x.sheets[2])[14],
            category: x.row(i, x.sheets[2])[15],
            location: x.row(i, x.sheets[2])[16]
          }
        ],
        categories: [
          x.row(i, x.sheets[2])[9],
          x.row(i, x.sheets[2])[10]
        ]
      },
      skills: [
        x.row(i, x.sheets[2])[11],
        x.row(i, x.sheets[2])[12],
        x.row(i, x.sheets[2])[13]
      ],
      acquired: x.row(i, x.sheets[2])[19]
    }

    if blade[:acquired] == nil
      blade[:acquired] = "Core"
    end

    case blade[:name]
      when "N***"
        blade[:name] = "Nia"
      when "A***"
        blade[:name] = "Akhos"
      when "C***"
        blade[:name] = "Cressidus"
      when "M***"
        blade[:name] = "Mikhail"
      when "O***"
        blade[:name] = "Obrona"
      when "Pa**"
        blade[:name] = "Patroka"
      when "Pe**"
        blade[:name] = "Perdido"
      when "S***"
        blade[:name] = "Sever"
    end

    pp blade
    pp "-"*50A
  end
end
