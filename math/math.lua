--has math I'll be using alot



function lerp(ob1, ob2, t) 
  return ((1-t) * ob1 + t *  ob2)
end

function circleCollision(ob1,ob2)
  return distance(ob1,ob2) < (ob1.r+ob2.r)
end

function mouseOver(v)
 return mouseX > v.x     and 
        mouseX < v.x+v.w and
        mouseY > v.y     and
        mouseY < v.y+v.h
end

function distance(ob1,ob2)
  local dist = math.sqrt(((ob1.x-ob2.x)^2)+((ob1.y-ob2.y)^2))
  return dist
end
