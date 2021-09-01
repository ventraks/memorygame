
local successCb
local failCb
local resultReceived = false

RegisterNUICallback('ThermiteResult', function(data, cb)
    SetNuiFocus(false, false)
    resultReceived = true
    if data.success then
        successCb()
    else
        failCb()
    end
    cb('ok')
end)

-- correctBlocks = Number of correct blocks the player needs to click
-- incorrectBlocks = number of incorrect blocks after which the game will fail
-- timetoShow = time in secs for which the right blocks will be shown
-- timetoLose = maximum time after timetoshow expires for player to select the right blocks

exports('thermiteminigame', function(correctBlocks, incorrectBlocks, timetoShow, timetoLose, success, fail)
    resultReceived = false
    successCb = success
    failCb = fail
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "Start",
        correct = correctBlocks,
        incorrect = incorrectBlocks,
        showtime = timetoShow,
        losetime = timetoLose + timetoShow,
    })
end)