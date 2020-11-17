require "uri"
require "csv"

CLASS_COLORS = {
  "Death Knight" => "#C41F3B",
  "Demon Hunter" => "#A330C9",
  "Druid" => "#FF7D0A",
  "Hunter" => "#ABD473",
  "Mage" => "#69CCF0",
  "Monk" => "#00FF96",
  "Paladin" => "#F58CBA",
  "Priest" => "#FFFFFF",
  "Rogue" => "#FFF569",
  "Shaman" => "#0070DE",
  "Warlock" => "#9482C9",
  "Warrior" => "#C79C6E",
}

if PlayableClass.count < 12
  puts "Creating Playable Classes"
  BattleNet.get("/data/wow/playable-class/index")["classes"].each do |pci|
    pc = BattleNet.get(pci.dig("key", "href"))
    class_name = pc["name"]
    puts class_name

    playable_class = PlayableClass.find_or_create_by({ name: class_name }) do |m|
      m.color = CLASS_COLORS[class_name]
    end

    unless playable_class.icon.attached?
      icon = BattleNet.get(pc.dig("media", "key", "href")).dig("assets").find { |a| a["key"] == "icon" }["value"]
      filename = File.basename(URI.parse(icon).path)
      file = URI.open(icon)
      playable_class.icon.attach(io: file, filename: filename)
    end

    pc["specializations"].each do |si|
      spec = BattleNet.get(si.dig("key", "href"))
      spec_name = spec["name"]
      puts " -> #{spec_name}"

      specialization = playable_class.specializations.find_or_create_by({ name: spec_name })
      unless specialization.icon.attached?
        icon = BattleNet.get(spec.dig("media", "key", "href")).dig("assets").find { |a| a["key"] == "icon" }["value"]
        filename = File.basename(URI.parse(icon).path)
        file = URI.open(icon)
        specialization.icon.attach(io: file, filename: filename)
      end

      playable_class.specializations.find_or_create_by({ name: class_name })
    end
  end
end

categorizations = {
  "Combat" => { color: "#ffbf80", sub: [
    "AOE",
    "Filler",
    "Cooldown - Long",
    "Cooldown - Short",
    "Resource Generator",
    "Resource Spender",
    "Other",
  ] },
  "Defensive" => { color: "#c6ff80", sub: [
    "Off-spec Heal",
    "Defensive Cooldown",
    "Other",
  ] },
  "Auras" => { color: "#ff94e1", sub: [
    "Aura",
    "Buff",
    "Cleanse",
    "Other",
  ] },
  "Movement" => { color: "#61c0ff", sub: [
    "Utility",
    "Speed Boost",
    "Alternative",
    "Other",
  ] },
  "Crowd Control / PVP" => { color: "#8880ff", sub: [
    "Taunt",
    "Interrupt",
    "Incapacitate",
    "Stun",
    "Slow / Snare",
    "Displacement",
    "Silence",
    "PVP Talent",
    "Other",
  ] },
  "Utility" => { color: "#fffbbd", sub: [
    "Spec",
    "Class",
    "Resurrection",
    "Other",
  ] },
  "Other" => { color: "#adadad", sub: [
    "Other",
  ] },
}

categorizations.each do |main, category|
  category[:sub].each do |name|
    Category.find_or_create_by({ main: main, name: name }) do |m|
      m.color = category[:color]
    end
  end
end

keymap = Keymap.find_or_create_by({ name: "Default" })
if keymap.action_bars.empty?
  keymap.action_bars.create([
    { name: "Main" },
    { name: "Bottom Left" },
    { name: "Bottom Right" },
    { name: "Right 1" },
    { name: "Right 2" },
  ])
end

headers = %i[type spec name sub passive skill_type spell_id]

PlayableClass.all.each do |pc|
  lines = CSV.read(Rails.root.join("db", "data", "#{pc.name.gsub(" ", "").underscore}.txt"), col_sep: ";")
  lines.each do |line|
    data = headers.zip(line).to_h
    if data[:skill_type] == "SPELL"
      spec = pc.specializations.find_by(name: data[:spec])
      puts "#{pc.name} -> #{spec.name} -> #{data[:name]}"

      ability = spec.abilities.find_or_create_by({ spell_id: data[:spell_id] }) do |m|
        m.name = data[:name]
        m.subtext = data[:sub]
        m.is_talent = data[:type] == "Talent"
        m.is_passive = data[:passive]
      end

      unless ability.icon.attached?
        assets = BattleNet.get("/data/wow/media/spell/#{ability.spell_id}").dig("assets")
        if assets
          icon = assets.find { |a| a["key"] == "icon" }["value"]
          filename = File.basename(URI.parse(icon).path)
          file = URI.open(icon)
          ability.icon.attach(io: file, filename: filename)
        end
      end
    end
  end
end
