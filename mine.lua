write("d:")
local d = tonumber(read())  -- Assuming d is the distance to move forward
write("v:")
local v = tonumber(read())  -- Assuming v is the number of layers to dig down
turtle.refuel(1000)
local x1 = d  -- Assuming x1 is the width in the x-direction
local y1 = d  -- Assuming y1 is the length in the y-direction

-- Function for moving down and digging blocks
local function movedown()
    turtle.forward()
    for _ = 1, v do
        turtle.dig()
        turtle.digDown()
        turtle.down()
    end
    turtle.dig()
end

-- Function for moving up and digging blocks
local function moveup()
    turtle.forward()
    for _ = 1, v do
        turtle.dig()
        turtle.digUp()
        turtle.up()
    end
    turtle.dig()
end
local function dropCobblestone() --выброс коблы
    for slot = 1, 16 do
        turtle.select(slot)
        local itemDetails = turtle.getItemDetail()
        if itemDetails and itemDetails.name == "minecraft:cobblestone" then
            turtle.drop() 
        end
    end
end
for x = 1, x1 do
    for y = 1, y1 do
        moveup()
        movedown()
        dropCobblestone()  -- Assuming cobblestonedrop() is defined elsewhere
    end
    if x %2==0 then
        turtle.forward()
        turtle.turnLeft()
        moveup()
        turtle.turnLeft()
        movedown()
    else
        turtle.forward()
        turtle.turnRight()
        moveup()
        turtle.turnRight()
        movedown()
    end
end
