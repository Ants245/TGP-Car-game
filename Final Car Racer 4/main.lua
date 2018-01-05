require "images"
require "audio"
function love.load()


  love.graphics.setBackgroundColor(104, 136, 248) --set the background color to a nice blue
  love.window.setMode(1430, 700) --set the window dimensions to 650 by 650
  love.audio.setVolume(1)

  RoadHeight = 99

  test1 = 0

  pauseTimeout = 0 
  countDown = 0
  countDownFinish = 0

  menuToggle = 1
  audioToggle = 1
  StartTextToggle = 0;

  restartToggle = 0

  PoliceSpeedX = 0
  AudiSpeedX = 0
  TruckSpeedX = 0
  Black_ViperSpeedX = 0
  CurrentFrameTime =0 
  SpeedDecresTime = 500

  WinSound = 0


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

  music1T = 0
  music2T = 0
  music3T = 0
  music4T = 0
  music5T = 0
  music6T = 0


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

function love.keypressed(key)

  if key == "d" then
    PoliceSpeedX = PoliceSpeedX + 0.2
  end
  if key == "1" then
    AudiSpeedX = AudiSpeedX + 0.2
  end
  if key == "right" then
    TruckSpeedX = TruckSpeedX + 0.2
  end
  if key == "kp3" then
    Black_ViperSpeedX = Black_ViperSpeedX + 0.2
  end
  if  key == "escape" then
    love.event.quit(Close:play())
  end
  if key == "s" then
    countDownFinish = 1
    countDown = 1
    Countdown:play()
    StartTextToggle = 1
  end

  if  key == "escape" then
    love.event.quit(Close:play())
  end
  if key == "f1" then
    if music1T == 0 then
      music:play()
      music1T = 1
    elseif music1T == 1 then
      music:stop()
      music1T = 0
    end
  end
  if key == "f2" then
    if music2T == 0 then
      music2:play()
      music2T = 1
    elseif music2T == 1 then
      music2:stop()
      music2T = 0
    end
  end
  if key == "f3" then
    if music3T == 0 then
      music3:play()
      music3T = 1
    elseif music3T == 1 then
      music3:stop()
      music3T = 0
    end
  end
  if key == "f4" then
    if music4T == 0 then
      music4:play()
      music4T = 1
    elseif music4T == 1 then
      music4:stop()
      music4T = 0
    end
  end
  if key == "f5" then
    if music5T == 0 then
      music5:play()
      music5T = 1
    elseif music5T == 1 then
      music5:stop()
      music5T = 0
    end
  end
  if key == "f6" then 
    if music6T == 0 then
      music6:play()
      music6T = 1
    elseif music6T == 1 then
      music6:stop()
      music6T = 0
    end
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
  if key == "m" then
    if menuToggle == 0 then
      menuToggle = 1 
    elseif menuToggle == 1 then
      menuToggle = 0
    elseif menuToggle == 2 then
      menuToggle = 1
    elseif menuToggle == 3 then
      menuToggle = 1
    end
  end
end

function love.mousepressed(x,y,button)

  if menuToggle == 1 then
    if x < 868 and x > 497 and y < 323 and y > 249 and button == 1 then
      menuToggle = 0
    end

    if x < 868 and x > 497 and y < 422 and y > 350 and button == 1 then
      menuToggle = 2
    end

    if x < 868 and x > 497 and y < 523 and y > 450 and button == 1 then
      love.event.quit(Close:play())
    end
  end

  if menuToggle == 2 then
    if x < 858 and x > 801 and y < 410 and y > 360 and button == 1 then
      if audioToggle == 1 then
        audioToggle = 0
        love.audio.setVolume(0)
      elseif audioToggle == 0 then
        audioToggle = 1
        love.audio.setVolume(1)
      end
    end
    if x < 1126 and x > 885 and y < 580 and y > 505 and button == 1 then
      menuToggle = 1
      end

    if x < 870 and x > 496 and y < 511 and y > 440 and button == 1 then
      menuToggle = 3
    end
  end

  if menuToggle == 0 and restartToggle == 1 then
    if x < 295 and x > 24 and y < 325 and y > 252 and button == 1 then
      WinSound = 0
      policex = 40
      policey = 200
      audix = 115
      audiy = 250
      truckx = 115
      trucky = 380
      black_viperx = 115
      black_vipery = 505
      restartToggle = 0 
      PoliceSpeedX = 0
      AudiSpeedX = 0
      TruckSpeedX = 0
      Black_ViperSpeedX = 0
    end
    if x < 295 and x > 24 and y < 428 and y > 352 and button == 1 then
      menuToggle = 1
    end
  end
end




function love.update(dt)

  CurrentFrameTime = CurrentFrameTime + dt
  if CurrentFrameTime > SpeedDecresTime then

    if SpeedX > 0 then
      SpeedX = SpeedX * 0.7
    else
      SpeedX = 0.0
    end

    CurrentFrameTime = 0
  end

  pauseTimeout = pauseTimeout + dt   -- we add the time passed since the last update, probably a very small number like 0.01
  if pauseTimeout >= 1 then
    pauseTimeout = pauseTimeout - 1   -- reduce our timer by a second, but don't discard the change... what if our framerate is 2/3 of a second?
  end
  countDown = countDown + dt


  policex = policex + PoliceSpeedX
  audix = audix + AudiSpeedX
  truckx = truckx + TruckSpeedX
  black_viperx = black_viperx + Black_ViperSpeedX
end


function wait(seconds)
  local start = os.time()
  repeat until os.time() > start + seconds
  end


  function FinishlineCollision()
    if menuToggle ~= 1 then
      if  policex >= 1200 then
        love.graphics.draw(winner,300,45)
        if  WinSound == 0 then
          player1:play()
          WinSound  = 1
        end
        restartToggle = 1
        audix = -111000
        truckx = -111000
        black_viperx = -111000
      end
      if  audix >= 1200 then
        love.graphics.draw(winner,300,175)
        if  WinSound == 0 then
          player2:play()
          WinSound  = 1
        end
        restartToggle = 1
        policex = -111000
        truckx = -111000
        black_viperx = -111000
      end
      if  truckx >= 1200 then
        love.graphics.draw(winner,300,305)
        if  WinSound == 0 then
          player3:play()
          WinSound  = 1
        end
        restartToggle = 1
        policex = -111000
        audix = -111000
        black_viperx = -111000
      end
      if  black_viperx >= 1200 then
        love.graphics.draw(winner,300,432)
        if  WinSound == 0 then
          player4:play()
          WinSound  = 1
        end
        restartToggle = 1
        policex = -111000
        audix = -111000
        truckx = -111000
      end
      end
    end

    function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
      return x1 < x2+w2 and
      x2 < x1+w1 and
      y1 < y2+h2 and
      y2 < y1+h1
    end

    function love.draw()
      if menuToggle == 0 then
        love.graphics.draw(background,50,RoadHeight*1)
        love.graphics.draw(background,50,RoadHeight*2+30)
        love.graphics.draw(background,50,RoadHeight*3+60)
        love.graphics.draw(background,50,RoadHeight*4+90)
        love.graphics.draw(boarder,50,93) --128
        love.graphics.draw(StartLine,57,99)
        love.graphics.draw(FinishLine,1165,99)
        love.graphics.draw(Controls,1253,60)

        if StartTextToggle == 0 then
          love.graphics.draw(StartText, 250,270);
        end
        
        if countDownFinish == 1 then
          if countDown > 1 and countDown < 2 then
            love.graphics.draw(four, 250,250)
          elseif countDown > 2 and countDown < 3 then
            love.graphics.draw(three, 250,250)
          elseif countDown > 3 and countDown < 4 then
            love.graphics.draw(two, 250,250)
          elseif countDown > 4 and countDown < 5 then
            love.graphics.draw(one, 250,250)
          elseif countDown > 5 and countDown < 6 then
            love.graphics.draw(go, 250,250)
          elseif countDown > 6 then
            countDownFinish = 0
          end     
        end

        love.graphics.setColor(255, 0, 0)
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.draw(police,policex,policey, -1.56, 0.3, 0.3)
        love.graphics.draw(audi,audix,audiy,1.56,0.3,0.3)
        love.graphics.draw(truck,truckx,trucky,1.56,0.3,0.3)
        love.graphics.draw(black_viper,black_viperx,black_vipery,1.56,0.3,0.3)

      elseif menuToggle == 1 then
        love.graphics.draw(Menu, 245,100)
        love.graphics.draw(MenuCars,0,0)

      elseif menuToggle == 2 then
        love.graphics.draw(MenuOptions, 245,100)
        love.graphics.draw(MenuCars,0,0)  
        if audioToggle == 1 then
          love.graphics.draw(MenuTick, 790,335)
        end

      elseif menuToggle == 3 then
        love.graphics.draw(ControlMenu,245,100)
        love.graphics.draw(MenuCars,0,0)  

      end
      love.graphics.draw(title,100,0)



      if restartToggle == 1 and menuToggle == 0 then
        love.graphics.draw(restartMenu, 10,200)
        
      end

      FinishlineCollision()


    end