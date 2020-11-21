module Export
  def self.icons
    # PlayableClass, Specialization
    Ability.all.each do |m|
      if m.icon.attached?
        FileUtils.cp(
          ActiveStorage::Blob.service.path_for(m.icon.key),
          Rails.root.join("public", "icons", "spell", m.icon.filename.to_s)
        )
      end
    end
  end

  def self.data
    data = {}

    PlayableClass.all.each do |pc|
      class_hash = pc.serializable_hash(except: [:id, :created_at, :updated_at]).transform_keys { |k| k.camelize(:lower) }
      class_hash["icon"] = pc.icon.filename.to_s
      data[pc.name.parameterize] = class_hash

      class_hash["specializations"] = {}
      pc.specializations.each do |s|
        spec_hash = s.serializable_hash(except: [:id, :created_at, :updated_at, :playable_class_id]).transform_keys { |k| k.camelize(:lower) }
        if s.icon.attached?
          spec_hash["icon"] = s.icon.filename.to_s
        else
          spec_hash["icon"] = class_hash["icon"]
        end

        spec_hash["abilities"] = []
        s.abilities.each do |a|
          ability_hash = a.serializable_hash(except: [:id, :created_at, :updated_at, :specialization_id, :category_id, :subtext]).transform_keys { |k| k.camelize(:lower) }
          ability_hash["icon"] = a.icon.filename.to_s if a.icon.attached?
          spec_hash["abilities"] << ability_hash
        end

        class_hash["specializations"][s.name.parameterize] = spec_hash
      end
    end

    File.write(Rails.root.join("src/util/data.json"), data.to_json)
  end
end
