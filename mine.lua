write("Distance (d): ")
local d = tonumber(read())  -- Distance to move forward
write("Layers (v): ")
local v = tonumber(read()) - 1  -- Number of layers to dig down

turtle.refuel(1000)

local x1 = d  -- Width in the x-direction
local y1 = d / 2  -- Length in the y-direction

-- Function to move down and dig blocks
local function movedown()
    for _ = 1, v do
        turtle.dig()
        turtle.digDown()
        turtle.down()
    end
    turtle.dig()
end

-- Function to move up and dig blocks
local function moveup()
    for _ = 1, v do
        turtle.dig()
        turtle.digUp()
        turtle.up()
    end
    turtle.dig()
end

-- Function to drop unwanted items
local function dropCobblestone()
    local keepItems = {
        "minecraft:raw_iron", "minecraft:raw_gold", "minecraft:quartz",
        "minecraft:diamond", "minecraft:lapis_lazuli", "minecraft:coal",
        "minecraft:ancient_debris", "create:raw_zinc"
    }

    for slot = 1, 16 do
        turtle.refuel(1000)
        turtle.select(slot)
        local itemDetails = turtle.getItemDetail()
        if itemDetails then
            local keep = false
            for _, value in ipairs(keepItems) do
                if itemDetails.name == value then
                    keep = true
                    break
                end
            end
            if not keep then
                turtle.drop()
            end
        end
    end
end

local arr = 1
for x = 1, x1 do
    for y = 1, y1 do
        turtle.forward()
        moveup()
        turtle.forward()
        movedown()
        arr = arr + 1
        if arr % 3 == 0 then
            dropCobblestone()
        end
    end
    if x % 2 == 0 then
        turtle.forward()
        turtle.turnLeft()
        moveup()
        turtle.forward()
        turtle.turnLeft()
        movedown()
    else
        turtle.forward()
        turtle.turnRight()
        moveup()
        turtle.forward()
        turtle.turnRight()
        movedown()
    end
end
