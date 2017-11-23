require "conf"

function love.load()
	background = love.graphics.newImage("road.png")
  police = love.graphics.newImage("Police.png")
  audi = love.graphics.newImage("Audi.png")
  truck = love.graphics.newImage("Truck.png")
  black_viper = love.graphics.newImage("Black_viper.png")
  finishline = love.graphics.newImage("finishline.png")
  startline = love.graphics.newImage("startline.jpg")
  winner = love.graphics.newImage("winner.jpg")
  
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
  
  
  font = love.graphics.newFont(2064)
   
  love.window.setFullscreen(true,"desktop")
  love.window.setTitle("Racing game")
  
  policex = 10
  policey = 100
  audix = 85
  audiy = 275
  truckx = 85
  trucky = 540
  black_viperx = 85
  black_vipery = 790
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
--if updatePauseTimeout(dt) then
  
end

--function updatePauseTimeout(dt)
--    pauseTimeout = pauseTimeout and (pauseTimeout - dt) or 6
--	return pauseTimeout < 1
--end

--function drawPauseTimeout()
--Countdown:play()
-- if pauseTimeout > 5 then
	--    love.graphics.print("5", 0, 100, love.window.getWidth(), "centre")
  -- if pauseTimeout > 4 thenlove.window.getWidth()
	--    love.graphics.print("4", 0, 100, love.window.getWidth(), "centre")
  -- if pauseTimeout > 3 then
	--    love.graphics.print("3", 0, 100, love.window.getWidth(), "centre")
	--elseif pauseTimeout > 2 then
	--    love.graphics.print("2", 0, 100, love.window.getWidth(), "centre")
	--elseif pauseTimeout > 1 then
	--    love.graphics.print("1", 0, 100, love.window.getWidth(), "centre")
	--elseif pauseTimeout > 0 then
	--    love.graphics.print("GO!", 0, 100, love.window.getWidth(), "centre")
	--end
--end

function FinishlineCollision()
  
  if  policex >= 1750 then
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
	-- let's draw a background
	 for i = 0, love.graphics.getWidth() / background:getWidth() do
   for j = 0, love.graphics.getHeight() / background:getHeight() do
     love.graphics.draw(background, i * background:getWidth(), j * background:getHeight())
     end

  love.graphics.draw(finishline,1925,-10,1.57,3.4,1.4)
  love.graphics.draw(startline,-5,1100,-1.57,3.4,1.4)
  love.graphics.draw(police,policex,policey, -1.56, 0.3, 0.3)
  love.graphics.draw(audi,audix,audiy,1.56,0.3,0.3)
  love.graphics.draw(truck,truckx,trucky,1.56,0.3,0.3)
  love.graphics.draw(black_viper,black_viperx,black_vipery,1.56,0.3,0.3)

 --  drawPauseTimeout()
 
 FinishlineCollision()

 end
end