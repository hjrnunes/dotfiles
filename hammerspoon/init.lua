-- HAMMERSPOON config

-- Auto-reload config
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()


local hyper = {"⌃", "⌘"}

-- definitions
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDWIDTH = 6
hs.grid.GRIDHEIGHT = 8

local open_iterm = function ()
    os.execute("open /Applications/iTerm.app")
end

-- Applications
hs.hotkey.bind(hyper, 'i', open_iterm)

-- a helper function that returns another function that resizes the current window
-- to a certain grid size.
local gridset = function(x, y, w, h)
    return function()
        cur_window = hs.window.focusedWindow()
        hs.grid.set(
            cur_window,
            {x=x, y=y, w=w, h=h},
            cur_window:screen()
        )
    end
end

-- function to move window one screen left or back if it's already on the
-- leftmost
local toNextScreen = function()
    return function()
        currentWindow = hs.window.focusedWindow()
        s = hs.screen{x=1,y=0}

        if s == currentWindow:screen() then
            s = hs.screen{x=0,y=0}
            currentWindow:moveToScreen(s)
        else
            currentWindow:moveToScreen(s)
        end
    end
end


-- movement keys
hs.hotkey.bind(hyper, 'j', toNextScreen())

hs.hotkey.bind(hyper, '[', gridset(0, 0, 3, 8)) -- left half
hs.hotkey.bind(hyper, ']', gridset(3, 0, 3, 8)) -- right half

hs.hotkey.bind(hyper, 'p', gridset(0, 0, 3, 4)) -- left upper quarter
-- hs.hotkey.bind(hyper, 'p', gridset(0, 4, 5, 4)) -- left bottom 3/4

hs.hotkey.bind(hyper, "'", gridset(0, 0, 4, 8)) -- left 3/4
hs.hotkey.bind(hyper, "\\", gridset(0, 4, 5, 4)) -- left bottom 3/4
hs.hotkey.bind(hyper, ";", gridset(1, 0, 4, 8)) -- center 4/6
hs.hotkey.bind(hyper, 'm', hs.grid.maximizeWindow)

-- Window filter

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

print("---------------------")
hs.application.enableSpotlightForNameSearches(true)

local finderName = hs.application'finder':name()
local wf_finder = hs.window.filter.new{finderName}
local finderWindows = wf_finder:getWindows()

print("--")
local nFinderWindows = tablelength(finderWindows)
print("Finder windows", nFinderWindows)

local extraWindows = math.max(0, nFinderWindows - 5)
print("Extra Finder windows", extraWindows)
for i = 1, extraWindows, 1
do
    local cur_window = finderWindows[i]
    cur_window:close()
end

local missingWindows = math.max(0, 5 - nFinderWindows)
print("missing Finder windows", missingWindows)
for _ = 1, missingWindows, 1
do
    hs.osascript.applescript("tell application \"Finder\" to make new Finder window")
end


local windowPos = {
    {x=0, y=0, w=2, h=4},
    {x=2, y=0, w=2, h=4},
    {x=4, y=0, w=2, h=4},
    {x=0, y=4, w=3, h=4},
    {x=3, y=4, w=3, h=4},
}

finderWindows = wf_finder:getWindows() -- get windows again

for i,window in pairs(finderWindows)
do
    hs.grid.set(
            window,
            windowPos[i],
            window:screen()
        )
end


-- local cur_window = finderWindows[1]
-- hs.grid.set(
--             cur_window,
--             {x=0, y=0, w=2, h=4},
--             cur_window:screen()
--         )
-- cur_window = finderWindows[2]
-- hs.grid.set(
--             cur_window,
--             {x=2, y=0, w=2, h=4},
--             cur_window:screen()
--         )
-- cur_window = finderWindows[3]
-- hs.grid.set(
--             cur_window,
--             {x=4, y=0, w=2, h=4},
--             cur_window:screen()
--         )
-- cur_window = finderWindows[4]
-- hs.grid.set(
--             cur_window,
--             {x=0, y=4, w=3, h=4},
--             cur_window:screen()
--         )
-- cur_window = finderWindows[5]
-- hs.grid.set(
--             cur_window,
--             {x=3, y=4, w=3, h=4},
--             cur_window:screen()
--         )