-- [[ AuraX Hub | The Final Execution ]] --
-- Bu kod senin GitHub linkini en güvenli şekilde çalıştırır.

local githubLink = "https://raw.githubusercontent.com/Nenecosturan/AuraX-HUB-BloxFruits/refs/heads/main/Main.lua"

local function Notify(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 8
    })
end

-- 1. ADIM: BAĞLANTIYI DOĞRULA VE ÇEK
local function ExecuteAuraX()
    Notify("AuraX [AX]", "GitHub sunucusuna bağlanılıyor...")
    
    local success, scriptContent = pcall(function()
        return game:HttpGet(githubLink)
    end)

    if success and scriptContent then
        Notify("AuraX Başarılı", "Kod çekildi, Arceus motoruna yükleniyor...")
        task.wait(1)
        
        -- 2. ADIM: KODU ÇALIŞTIR
        local runSuccess, runError = pcall(function()
            loadstring(scriptContent)()
        end)

        if not runSuccess then
            warn("AuraX Çalıştırma Hatası: " .. tostring(runError))
            Notify("Hata!", "Kod çalıştırılırken bir sorun oluştu.")
        end
    else
        -- 3. ADIM: HATA DURUMUNDA YEDEK PLAN
        warn("AuraX Bağlantı Hatası: " .. tostring(scriptContent))
        Notify("Bağlantı Kesildi", "GitHub'a ulaşılamıyor. 5 saniye sonra tekrar denenecek...")
        task.wait(5)
        ExecuteAuraX() -- Otomatik Tekrar Deneme (Garantili Mod)
    end
end

-- SİSTEMİ BAŞLAT
if game.PlaceId == 2753915549 or game.PlaceId == 4442245219 or game.PlaceId == 7449423635 then
    ExecuteAuraX()
else
    Notify("Hatalı Oyun", "Bu script sadece Blox Fruits için tasarlanmıştır!")
end
