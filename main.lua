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
  player.maxHealth = player.endurance * 2

end

-- Print player status
function statusPrint()

  print(player.rank .. " " .. player.name)
  print(player.strength .. " str   ", player.damage .. " damage ", player.weapon.name .. " (" .. player.weapon.factor ..")")
  print(player.dexterity .. " dex   " , player.aim .. " aim")
  print(player.endurance .. " end   " , player.health .. " health of " .. player.maxHealth)

end

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
  else   return nil end

end

-- Game start including welcome, chargen and name-asking
function gameStart()

  print("Welcome to Quest!")
  playerGen()
  playerUpdate(0,0,0)
  print("What is your name?")
  player.name = inputGet()

end

-- Game
gameStart()

statusPrint()

input = inputGet()



for u=1, string.len(input) do
  print(string.char(string.byte(input, u)))
end

input = nil
