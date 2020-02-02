require "libraries/classHandler"
require "classes/conductor"

function love.load()
  
  boxes={}
  
  song = love.audio.newSource("music/The Space Between.wav",'stream')
  song:play()
  song:setVolume(0.5)
  song:setLooping(false)
  tracker = conductor:new{bpm=520}
  
  red=math.random(0.3,1)
  green=math.random(0.3,1)
  blue=math.random(0.3,1)
  
  beatTime = 60 / 520
  beatPosition = 0
  lastBeat=0
  
  startTime=song:tell()
  
  beatTimer=0
  timePos = 0
  
  songLength=song:getDuration()
  
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

function love.update()
  
  
  
  timePos= (song:tell() - startTime)
  beatPosition = timePos / beatTime

  if(timePos> lastBeat + beatTime*7.6) then
    red=math.random(0.3,1)
    green=math.random(0.3,1)
    blue=math.random(0.3,1)
  
    table.insert(boxes,createBox(800-64,math.random(200,400),10))
    lastBeat = timePos
  end
  
  for i,v in ipairs(boxes) do
    v.x=v.x-v.speed
  end
  
   
   if(timePos<=startTime) then
    lastBeat=0
  end
 
end

function love.draw()
  for i,v in ipairs(boxes) do
    love.graphics.rectangle("fill",v.x,v.y,32,600)
  end
  love.graphics.setColor(0,0,0)
  love.graphics.rectangle("fill",0,400,800,600)
  love.graphics.setColor(1,0.5,0.3)
  love.graphics.rectangle("fill",300,0,32,600)
  love.graphics.setColor(red,green,blue)
  
  love.graphics.setColor(1,1,1)
  love.graphics.print(timePos,200,0)
  love.graphics.setColor(1,1,1)
  love.graphics.print(startTime,0,0)
end

function love.keypressed(key)
  if(key=="escape")then
    love.event.push("quit")
  end
  
end

