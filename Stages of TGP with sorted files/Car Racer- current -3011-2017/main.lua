--

function love.load()


  love.graphics.setBackgroundColor(104, 136, 248) --set the background color to a nice blue
  love.window.setMode(1430, 700) --set the window dimensions to 650 by 650

  background = love.graphics.newImage("Road.png")
  police = love.graphics.newImage("Police.png")
  audi = love.graphics.newImage("Audi.png")
  truck = love.graphics.newImage("Truck.png")
  black_viper = love.graphics.newImage("Black_viper.png")
  FinishLine = love.graphics.newImage("FinishLine.png")
  StartLine = love.graphics.newImage("StartLine.png")
  winner = love.graphics.newImage("winner.jpg")
  boarder = love.graphics.newImage("boarder.png")
  title = love.graphics.newImage("title.png")
  Controls = love.graphics.newImage("Controls.png")

  RoadHeight = 99

  test1 = 0

  pauseTimeout = 0 
  countDown = 0
  countDownFinish = 0


  font = love.graphics.newFont(2064)

  love.window.setTitle("Racing game")

  policex = 40
  policey = 200
  audix = 115
  audiy = 250
  truckx = 115
  trucky = 380
  black_viperx = 115
  black_vipery = 505
  
  
  Countdown = love.audio.newSource("Countdown.mp3", "static")
  Close = love.audio.newSource("Close.mp3", "static")
  horn = love.audio.newSource("siren.mp3", "static")
  horn2 = love.audio.newSource("Ahorn.mp3", "static")
  horn3 = love.audio.newSource("Dixie.mp3", "static")
  horn4 = love.audio.newSource("sal.mp3", "static")
  
  player1 = love.audio.newSource("player1.mp3", "static")
  player2 = love.audio.newSource("player2.mp3", "static")
  player3 = love.audio.newSource("player3.mp3", "static")
  player4 = love.audio.newSource("player4.mp3", "static")
  
  
  horn:setVolume(0.4)
  horn2:setVolume(0.4)
  horn3:setVolume(0.1)
  horn4:setVolume(1)
  
  music = love.audio.newSource("Tokyo Drift.mp3")
  music2 = love.audio.newSource("Born.mp3")
  music3 = love.audio.newSource("Dean.mp3")
  music4 = love.audio.newSource("High.mp3")
  music5 = love.audio.newSource("SPD.mp3")
  music6 = love.audio.newSource("500 Miles.mp3")
  
  volume =1
  music:setVolume(0.3)
  music2:setVolume(0.3)
  music3:setVolume(0.3)
  music4:setVolume(0.28)
  music5:setVolume(0.3)
  music6:setVolume(0.8)
end

function love.keypressed(key)
  if key == "d" then
    policex = policex + 10
  end
  if key == "l" then
    audix = audix + 10
  end
  if key == "right" then
    truckx = truckx + 10
  end
  if key == "kp3" then
    black_viperx = black_viperx + 10
  end
  if  key == "escape" then
    love.event.quit(Close:play())
  end
  if key == "s" then
    countDownFinish = 1
    countDown = 0
  end
  if key == "d" then
    policex = policex + 10
  end
  if key == "l" then
    audix = audix + 10
  end
  if key == "right" then
    truckx = truckx + 10
  end
  if key == "kp3" then
    black_viperx = black_viperx + 10
  end
  if  key == "escape" then
    love.event.quit(Close:play())
  end
  if key == "f1" then
    music:play()
  end
  if key == "f2" then
    music:stop()
  end
  if key == "f3" then
    music2:play()
  end
  if key == "f4" then
    music2:stop()
  end
  if key == "f5" then
    music3:play()
  end
  if key == "f6" then 
    music3:stop()
  end
  if key == "f7" then
    music4:play()
  end
  if key == "f8" then
    music4:stop()
  end
  if key == "f9" then
    music5:play()
  end
  if key == "f10" then
    music5:stop()
  end
  if key == "f11" then
    music6:play()
  end
  if key == "f12" then
    music6:stop()
  end
  if key == "w" then
    horn:play()
   end
  if key == "i" then
    horn2:play()
  end
  if key == "up" then
    horn3:play()
  end
  if key == "kp5" then
    horn4:play()
  end
  

end


function love.update(dt)

  pauseTimeout = pauseTimeout + dt   -- we add the time passed since the last update, probably a very small number like 0.01
  if pauseTimeout >= 1 then
    pauseTimeout = pauseTimeout - 1   -- reduce our timer by a second, but don't discard the change... what if our framerate is 2/3 of a second?
  end
  countDown = countDown + dt
end



function FinishlineCollision()

  if  policex >= 1200 then
    love.graphics.draw(winner,0,0,0,5,0.9)
    player1:play()
    audix = -111000
    truckx = -111000
    black_viperx = -111000
  end
  if  audix >= 1825 then
    love.graphics.draw(winner,0,255,0,5,0.9)
    player2:play()
    policex = -111000
    truckx = -111000
    black_viperx = -111000
  end
  if  truckx >= 1825 then
    love.graphics.draw(winner,0,510,0,5,0.9)
    player3:play()
    policex = -111000
    audix = -111000
    black_viperx = -111000
  end
  if  black_viperx >= 1825 then
    love.graphics.draw(winner,0,775,0,5,0.9)
    player4:play()
    policex = -111000
    audix = -111000
    truckx = -111000
  end
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
  x2 < x1+w1 and
  y1 < y2+h2 and
  y2 < y1+h1
end

function love.draw()

  love.graphics.draw(background,50,RoadHeight*1)
  love.graphics.draw(background,50,RoadHeight*2+30)
  love.graphics.draw(background,50,RoadHeight*3+60)
  love.graphics.draw(background,50,RoadHeight*4+90)
  love.graphics.draw(boarder,50,93) --128
  love.graphics.draw(title,0,0)
  love.graphics.draw(StartLine,57,99)
  love.graphics.draw(FinishLine,1165,99)
  love.graphics.draw(Controls,1253,60)
  -- let's draw a background
  --[[for i = 0, love.graphics.getWidth() / background:getWidth() do
   for j = 0, love.graphics.getHeight() / background:getHeight() do
     love.graphics.draw(background, i * background:getWidth(), j * background:getHeight())
     end
--]]
  if countDownFinish == 1 then
    if countDown > 1 and countDown < 2 then
      love.graphics.print("5", 250, 250, 0, 10, 10)
    elseif countDown > 2 and countDown < 3 then
      love.graphics.print("4", 250, 250, 0, 10, 10)
    elseif countDown > 3 and countDown < 4 then
      love.graphics.print("2", 250, 250, 0, 10, 10)
    elseif countDown > 4 and countDown < 5 then
      love.graphics.print("1", 250, 250, 0, 10, 10)
    elseif countDown > 5 and countDown < 6 then
      love.graphics.print("GO!", 250, 250, 0, 10, 10)
    elseif countDown > 6 then
        countDownFinish = 0
    end     
 end


  love.graphics.setColor(255, 0, 0)
  love.graphics.print(countDown,10,10)
  love.graphics.setColor(255, 255, 255, 255)

  love.graphics.draw(police,policex,policey, -1.56, 0.3, 0.3)
  love.graphics.draw(audi,audix,audiy,1.56,0.3,0.3)
  love.graphics.draw(truck,truckx,trucky,1.56,0.3,0.3)
  love.graphics.draw(black_viper,black_viperx,black_vipery,1.56,0.3,0.3)


  FinishlineCollision()


end