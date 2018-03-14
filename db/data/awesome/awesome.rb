# "Blades, Affinity, Skills" Sheet[2]
require_relative './sheets/blade1.rb'

# "Blade Stats Sheet[3]
# require_relative './sheets/blade2.rb'

# data = Roo::Spreadsheet.open('./Awesome.xlsx')
# p data.sheets

parse_blade1

def fix_values
  if blade[:obtained] == nil
    blade[:obtained] = "Core"
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
end
