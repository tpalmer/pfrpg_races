class PfrpgRaces::Race::Dwarf < PfrpgRaces::Race

  def name
    "Dwarf"
  end

  def description
    "Dwarves are both tough and wise, but also a bit gruff. They gain +2 Constitution, +2 Wisdom, and –2 Charisma."
  end

  def source
    "PFRPG"
  end

  def race_id
    1
  end

  def attribute_bonuses
    [ PfrpgRaces::StatBonus.new('CON', 2),
      PfrpgRaces::StatBonus.new('WIS', 2),
      PfrpgRaces::StatBonus.new('CHA',-2)
    ]
  end

  def bonus_choices
    []
  end

  def languages
    ["Common", "Dwarven"]
  end

  def speed
    20
  end

  def int_languages
    ["Giant", "Gnome", "Goblin", "Orc", "Terran", "Undercommon"]
  end

  def size
    "MEDIUM"
  end

  def choose_ability_bonus?
    false
  end

  def weapon_familiarity
    [ "Battleaxe", "Heavy Pick", "Warhammer" ]
  end

  def noarmor_effect
    p = Proc.new do |character, attribute, value|
      begin
        current_penalty = character.armor_speed_penalty
        character.bonuses.plus('speed', current_penalty)
      rescue Exception => e
        raise e
      end
    end
    Effect.new('misc', 'speed', 'noarmor', p)
  end

  def traits
    [
      PfrpgRaces::RacialTrait.new( :name => "Slow and Steady",
                       :description =>
                        "20FT base speed / not modified by encumbrance or armor",
                       :effects =>
                        [
                          noarmor_effect
                        ]
                      ),
      PfrpgRaces::RacialTrait.new( :name => "Defensive Training",
                       :description => "+4 dodge AC bonus vs. Giants"
                     ),
      PfrpgRaces::RacialTrait.new( :name => "Greed",
                       :description => "+2 appraise checks w/ precious metals or gemstones"
                     ),
      PfrpgRaces::RacialTrait.new( :name => "Hatred",
                       :description => "+1 attack bonus vs/ orc & goblinoid"
                     ),
      PfrpgRaces::RacialTrait.new( :name => "Hardy",
                       :description => "+2 save vs poison, spells and spell-like abilities"
                     ),
      PfrpgRaces::RacialTrait.new( :name => "Stabililty",
                      :description => "+4 CMD vs bull rush or trip"
                     ),
      PfrpgRaces::RacialTrait.new( :name => "Stonecunning",
                      :description => "+2 perception check vs unusual stonework"
                     )
    ]
  end
end
