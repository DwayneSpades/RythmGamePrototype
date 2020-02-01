require "libraries/classHandler"
require "classes/conductor"

function love.load()
  
  boxes={}
  
  song = love.audio.newSource("music/The Space Between.wav",'stream')
  song:play()
  song:setLooping(true)
  tracker = conductor:new{bpm=520}
  
  red=math.random(0.3,1)
  green=math.random(0.3,1)
  blue=math.random(0.3,1)
  
  beatTime = 60 / tracker.bpm
  beatPosition = 0
  lastBeat=0
  
  startTime=song:tell()
  
  beatTimer=0
  table.insert(boxes,createBox(math.random(200,400),0,5))
  
end

function createBox(x1,y1,speed1)
  local box=
  {
    x=x1,
    y=y1,
    speed=speed1
  }
  
  return box
end

function tickTimer()
  beatTimer=beatTimer+0.01
end

function checkTimer()
  if(beatTimer>beatTime)then
    
    beatTimer=0
  end
end

function love.update()
  
  timePos= (song:tell() - startTime)
  beatPosition = timePos / beatTime
  
  if(timePos> lastBeat + beatTime*4) then
    red=math.random(0.1,1)
    green=math.random(0.1,1)
    blue=math.random(0.1,1)
    table.insert(boxes,createBox(800,math.random(200,400),5))
    lastBeat = timePos
  end
  
  for i,v in ipairs(boxes) do
    v.x=v.x-v.speed
  end
end

function love.draw()
  for i,v in ipairs(boxes) do
    love.graphics.rectangle("fill",v.x,v.y,32,32)
  end
  
  love.graphics.setColor(red,green,blue)
end

function love.keypressed(key)
  if(key=="escape")then
    love.event.push("quit")
  end
  
end

