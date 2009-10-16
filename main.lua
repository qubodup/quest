function charToNum(char)

  if     char == "1" then return 1
  elseif char == "2" then return 2
  elseif char == "3" then return 3
  elseif char == "4" then return 4
  elseif char == "5" then return 5
  elseif char == "6" then return 6
  elseif char == "7" then return 7
  elseif char == "8" then return 8
  elseif char == "9" then return 9
  elseif char == "0" then return 0
  else return nil end

end

require("data")

-- Get input
function inputGet()

  return io.stdin:read()

end

-- Generate player stats
function playerGen()

  player = {
    strength  = math.random(10,12),
    dexterity = math.random(10,12),
    endurance = math.random(10,12),
    weapon = weapon.stick,
    rank = "Peasant",
    level = 1,
    cloth = cloth.pants,
  }
  player.health = player.endurance * 2

end

-- Update player stats
function playerUpdate(strength, dexterity, endurance)

  player.strength  = player.strength  + strength
  player.dexterity = player.dexterity + dexterity
  player.endurance = player.endurance + endurance
  player.damage = math.floor(player.strength * player.weapon.factor)
  player.aim = player.dexterity
  player.maxHealth = math.floor(player.endurance * 2 * player.cloth.factor)
  if player.health > player.maxHealth then
    player.health = player.maxHealth
  end

end

-- Print player status
function statusPrint()

  print(player.rank .. " " .. player.name)
  print(player.strength .. " str   ", player.damage .. " damage ", player.weapon.name .. " (" .. player.weapon.factor ..")")
  print(player.dexterity .. " dex   " , player.aim .. " aim")
  print(player.endurance .. " end   " , player.health .. " health of " .. player.maxHealth, player.cloth.name .. " (" .. player.cloth.factor .. ")")

end

-- Game start including character generation and name-asking
function gameStart()

  -- print("Welcome to Quest!")
  playerGen()
  print("What is your name, " .. string.lower(player.rank) .. "?")
  player.name = inputGet()
  -- Easter Egg
  if player.name == "pqgn" then
    player.cloth = cloth.shortPants
  end
  playerUpdate(0,0,0)

end

-- Game
gameStart()

statusPrint()

exploreOption = math.random(1,3)

print("Enter 1 to explore the " .. choice.explore[exploreOption].name)
print("Enter 2 to visit the " .. choice.home[player.level].name)
print("Enter 3 to hunt a " .. choice.battle[player.level].name)

--input = inputGet()

--for u=1, string.len(input) do
--  print(string.char(string.byte(input, u)))
--end

input = nil
