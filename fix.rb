require "csv"
require "json"

ability_headers = %i[type spec name subtext passive skill_type spell_id]
talent_headers = %i[type spec name passive subtext skill_type spell_id]

data = {}

Dir["/Users/jason/Desktop/data/*.txt"].sort.each do |path|
  class_name = File.basename(path, ".txt").split("_").map(&:capitalize).join(" ")
  _class = {}
  lines = CSV.read(path, col_sep: ";")
  abilities = lines.map do |line|
    (line[0] == "Ability" ? ability_headers : talent_headers).zip(line).to_h
  end

  abilities.each do |spell|
    _class[spell[:spec]] ||= []
    _class[spell[:spec]] << {
      name: spell[:name],
      subtext: spell[:subtext],
      isTalent: spell[:type] == "Talent",
      isPassive: spell[:passive] == "true",
      spellID: spell[:spell_id],
    }
  end

  _class.each do |_, spec|
    spec.sort_by! { |a| [a[:name].to_s, a[:subtext].to_s, a[:passive]] }
  end

  data[class_name] = _class
end

File.write("src/data/abilities.json", data.to_json)
