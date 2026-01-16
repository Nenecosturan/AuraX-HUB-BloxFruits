-- [[ AuraX Hub: Hızlı Başlatma Sistemi ]] --
-- Bu sürüm düşük performanslı mobil cihazlar için optimize edildi.

local function Notify(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 5
    })
end

Notify("AuraX [AX]", "Motor başlatılıyor, lütfen bekleyin...")

-- Redz Hub'ın ana kaynağını daha güvenli bir yöntemle çekiyoruz.
local success, result = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua")
end)

if success then
    Notify("AuraX [AX]", "Modüller yüklendi! Menü açılıyor...")
    
    -- Redz yazılarını AuraX'e çeviren 'Hafif' Patcher
    task.spawn(function()
        local CoreGui = game:GetService("CoreGui")
        while task.wait(1) do
            for _, v in pairs(CoreGui:GetDescendants()) do
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    if v.Text:find("Redz") or v.Text:find("redz") then
                        v.Text = v.Text:gsub("Redz Hub", "AuraX Hub")
                        v.Text = v.Text:gsub("Redz", "AuraX")
                    end
                end
            end
        end
    end)

    -- ANA KODU ÇALIŞTIR
    loadstring(result)()
else
    Notify("HATA!", "Sunucuya bağlanılamadı. Tekrar deneyin.")
    warn("AuraX Error: " .. tostring(result))
end
