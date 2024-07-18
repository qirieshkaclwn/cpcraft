--write("Distance (d): ")
--local d = tonumber(read())
local xg=16
local yg=28
write("Layers (v): ")
local v = tonumber(read())
turtle.refuel(1000)

local function dropCobblestone()
    local keepItems = {
        "minecraft:raw_iron", "minecraft:raw_gold", "minecraft:quartz",
        "minecraft:diamond", "minecraft:lapis_lazuli", "minecraft:coal",
        "minecraft:ancient_debris", "create:raw_zinc", "minecraft:raw_iron_block"
    }

    for slot = 1, 16 do
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

local function digAndMove()
    while turtle.detect() do
        turtle.dig()
        sleep(0.5)
    end
    turtle.forward()
end

local y = (yg / 2) + 1

for z = 1, v do
    for x = 1, xg do
        for n = 1, y do
            turtle.digUp()
            turtle.digDown()
            digAndMove()
            if n%5==0 then
                dropCobblestone()
            end
        end
        if x % 2 == 0 then
            if x ~= yg then
                turtle.turnRight()
                turtle.digUp()
                turtle.digDown()
                digAndMove()
                turtle.turnRight()
            else
                turtle.turnLeft()
            end
        else
            if x ~= yg then
                turtle.turnLeft()
                turtle.digUp()
                turtle.digDown()
                digAndMove()
                turtle.turnLeft()
            else
                turtle.turnRight()
            end
        end
    end
    for _ = 1, 3 do
        while not turtle.up() do
            if turtle.detectUp() then
                turtle.digUp()
                sleep(0.5)
            end
        end
    end
    local l = yg - 1
    for _ = 1, l do
        digAndMove()
    end
    turtle.turnLeft()
    turtle.digDown()
end
