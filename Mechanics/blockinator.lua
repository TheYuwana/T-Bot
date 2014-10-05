----------------------------
-- Variables
----------------------------
Blockinator = {}
Blockinator.__index = Blockinator

local blocksize = 24

local boxType = {"wood", "metal", "bomb", "wall", "freeze", "fire", "arrow", 
                "part1", "part2", "part3", "part4",
                "part5", "part6", "part7", "part8",
                "part9", "part10"}

--[[
  
  1 = wood
  2 = metal
  3 = bomb
  4 = wall
  5 = freeze
  6 = fire
  7 = arrow
  
  8 - 17 = parts
]]--
local grid = {
  "2", "2", "2", "1", "1", "1", "1", "1", "1", "1", "2", "2", "2",
  "2", "1", "2", "1", "1", "1", "1", "1", "1", "1", "2", "1", "2",
  "2", "2", "2", "1", "1", "1", "1", "1", "1", "1", "2", "2", "2",
  "4", "3", "1", "1", "1", "1", "1", "1", "1", "1", "1", "3", "4",
  "4", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "4",
  "4", "1", "6", "7", "1", "2", "10", "2", "1", "7", "5", "1", "4",
  "4", "1", "1", "1", "3", "2", "2", "2", "3", "1", "1", "1", "4",
  "4", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "4",
  "4", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "4",
  "4", "1", "1", "7", "1", "1", "1", "1", "1", "7", "1", "1", "4",
  "4", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "4",
  "4", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "4",
  
  }

----------------------------
-- Constructor
----------------------------
function Blockinator.create()
  
  local blk = {}
  setmetatable(blk, Blockinator)
  
  blk._startY = 480
  
  blk._movement = 1
  
  return blk
  
end
----------------------------
-- Functions
----------------------------
function Blockinator:make()
  
  -- test
  --table.insert(blocks, Block.create(0, -450, "m_wall"))
  --table.insert(blocks, Block.create(50, -450, "m_wall"))
  
  
  -- Ceiling
  for i=0, 12 do
    table.insert(blocks, Block.create(-288+(blocksize*(i*2)), 398, "wall"))
  end
  
  local y = 350
  local x = -288
  
  local yCount = 0
  local maxy = 13
  
  local xcount = 0
  
  for i=1, 156 do
    
    local c = tonumber(grid[i])
    
    table.insert(blocks, Block.create(x+(blocksize*(xcount*2)), y-(blocksize*(yCount*2)), boxType[c]))
    
    xcount = xcount + 1
    
    if i == maxy then
      
      xcount = 0
      yCount = yCount + 1
      maxy = maxy + 13
    
    end
  
  end

end
