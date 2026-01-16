-- [[ AuraX Hub | Arceus X Neo Optimized ]] --

local function SimpleNotify(txt)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "AuraX [AX]",
        Text = txt,
        Duration = 5
    })
end

SimpleNotify("Arceus X Neo Algılandı. Yükleniyor...")

-- Arceus X'in çökmemesi için yüklemeyi bir saniye geciktiriyoruz
task.wait(1.5)

local success, err = pcall(function()
    -- Redz Hub'ın en stabil ve Arceus uyumlu linkini deniyoruz
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"))()
end)

if not success then
    -- Eğer ilk deneme başarısız olursa alternatif yükleme metodu
    warn("AuraX Hata: " .. tostring(err))
    SimpleNotify("Yükleme başarısız. Konsolu kontrol et.")
else
    SimpleNotify("AuraX Menü Hazır!")
    
    -- Menü geldikten sonra isimleri değiştirmeyi dene (Hafif Mod)
    task.spawn(function()
        task.wait(5) -- Menünün tam yüklenmesini bekle
        pcall(function()
            for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                if v:IsA("TextLabel") and (v.Text:find("Redz") or v.Text:find("redz")) then
                    v.Text = "AuraX Hub"
                end
            end
        end)
    end)
end
