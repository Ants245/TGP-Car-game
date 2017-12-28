function love.music()
    Countdown = love.audio.newSource("Audio/In-Game Audio/Countdown.mp3", "static")
    Close = love.audio.newSource("Audio/In-Game Audio/Close.mp3", "static")
    horn = love.audio.newSource("Audio/Horns/siren.mp3", "static")
    horn2 = love.audio.newSource("Audio/Horns/Ahorn.mp3", "static")
    horn3 = love.audio.newSource("Audio/Horns/Dixie.mp3", "static")
    horn4 = love.audio.newSource("Audio/Horns/sal.mp3", "static")
  
    player1 = love.audio.newSource("Audio/Player victory/player1.mp3", "static")
    player2 = love.audio.newSource("Audio/Player victory/player2.mp3", "static")
    player3 = love.audio.newSource("Audio/Player victory/player3.mp3", "static")
    player4 = love.audio.newSource("Audio/Player victory/player4.mp3", "static")
  
    music = love.audio.newSource("Audio/In-Game Audio/Tokyo Drift.mp3")
    music2 = love.audio.newSource("Audio/In-Game Audio/Born.mp3")
    music3 = love.audio.newSource("Audio/In-Game Audio/Dean.mp3")
    music4 = love.audio.newSource("Audio/In-Game Audio/High.mp3")
    music5 = love.audio.newSource("Audio/In-Game Audio/SPD.mp3")
    music6 = love.audio.newSource("Audio/In-Game Audio/500 Miles.mp3")
  
    horn:setVolume(0.4)
    horn2:setVolume(0.4)
    horn3:setVolume(0.1)
    horn4:setVolume(1)

    volume = 1
    music:setVolume(0.3)
    music2:setVolume(0.3)
    music3:setVolume(0.3)
    music4:setVolume(0.28)
    music5:setVolume(0.3)
    music6:setVolume(0.8)
  end