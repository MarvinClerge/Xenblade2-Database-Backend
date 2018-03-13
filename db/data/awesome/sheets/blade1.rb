require 'roo'

def parse_blade1
  data = Roo::Spreadsheet.open('./Awesome.xlsx')

  blades = []

  (data.last_row(data.sheets[2]) + 1).times do |i|
    blade = {
      name: data.row(i, data.sheets[2])[0],
      element: data.row(i, data.sheets[2])[1],
      role: data.row(i, data.sheets[2])[2],
      weapon: data.row(i, data.sheets[2])[3],
      favorite_pouch_items: [
        {
          name: data.row(i, data.sheets[2])[4],
          category: data.row(i, data.sheets[2])[5],
          location: data.row(i, data.sheets[2])[6]
        },{
          name: data.row(i, data.sheets[2])[14],
          category: data.row(i, data.sheets[2])[15],
          location: data.row(i, data.sheets[2])[16]
        }
      ],
      favorite_pouch_categories: [
        data.row(i, data.sheets[2])[9],
        data.row(i, data.sheets[2])[10]
      ],
      skills: [
        data.row(i, data.sheets[2])[11],
        data.row(i, data.sheets[2])[12],
        data.row(i, data.sheets[2])[13]
      ],
      acquired: data.row(i, data.sheets[2])[19]
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

    blades.push(blade)
  end

  return blades
end
