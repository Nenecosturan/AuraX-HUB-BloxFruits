-- [[ AuraX Hub | Ultimate Blox Fruits Script ]] --
-- GitHub: Nenecosturan

-- 1. ÖN AYARLAR
getgenv().AuraX_Loaded = true
local PlaceID = game.PlaceId

-- 2. BİLDİRİM FONKSİYONU
local function Notify(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 8
    })
end

-- 3. OYUN KONTROLÜ VE YÜKLEME
-- Blox Fruits ID'leri: 2753915549 (Sea 1), 4442245219 (Sea 2), 7449423635 (Sea 3)
if PlaceID == 2753915549 or PlaceID == 4442245219 or PlaceID == 7449423635 then
    Notify("AuraX Hub", "Hoş geldin! Blox Fruits modülleri hazırlanıyor...")
    
    -- REDZ HUB'I AURAX OLARAK ÇALIŞTIRAN ANA MOTOR
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"))()
    end)

    if success then
        -- Menüdeki yazıları AuraX yapmak için arka plan döngüsü
        task.spawn(function()
            while task.wait(2) do
                pcall(function()
                    for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                        if v:IsA("TextLabel") or v:IsA("TextButton") then
                            if v.Text:find("Redz") or v.Text:find("redz") then
                                v.Text = v.Text:gsub("Redz", "AuraX")
                            end
                        end
                    end
                end)
            end
        end)
    else
        Notify("Hata!", "Motor yüklenemedi. Lütfen tekrar dene.")
        warn("AuraX Error: " .. tostring(err))
    end
else
    Notify("Hatalı Oyun", "Bu script sadece Blox Fruits içindir!")
end
