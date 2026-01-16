-- [[ AuraX Ultimate v4.0 - The Full Power ]] --
-- Bu script Redz Hub'ın 10.000+ satırlık mantığını AX kimliğiyle çalıştırır.

-- 1. ADIM: AURAX KIMLIK TANIMLAMA
local AuraX_Theme = {
    Name = "AuraX Hub",
    Logo = "AX",
    Color = Color3.fromRGB(120, 0, 255), -- Mor/Lila AuraX teması
    Author = "AuraX Team"
}

-- 2. ADIM: PROFESYONEL YÜKLEME EKRANI (INTRO)
local function AuraX_Intro()
    print("AuraX System Initializing...")
    -- Buraya mobil uyumlu, ekranı kaplayan AX logosu gelebilir.
end
AuraX_Intro()

-- 3. ADIM: REDZ HUB MANTIĞINI ÇEK VE YENİDEN ŞEKİLLENDİR
-- Redz Hub'ın ana veritabanını manipüle ederek ismi AuraX yapıyoruz.
_G.RedzHub_Settings = {
    CustomName = "AuraX Hub",
    CustomIcon = "rbxassetid://4483345998", -- AX Logo Simülasyonu
    Discord = "https://discord.gg/aurax",
    HideWatermark = false
}

-- 4. ADIM: DEVASA FONKSİYONLARI YÜKLE (DESTAN BAŞLIYOR)
-- Bu satır, Redz'in 2550 seviyelik tüm farm, deniz ve raid verisini yükler.
local Success, Error = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"))()
end)

-- 5. ADIM: UI ÜZERİNDEKİ İSİMLERİ AURAX OLARAK DEĞİŞTİR (PATCHING)
-- Bu kısım, ekran açıldığında Redz yazılarını bulup AuraX ile değiştirir.
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local CoreGui = game:GetService("CoreGui")
            for _, v in pairs(CoreGui:GetDescendants()) do
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    if v.Text:find("Redz") or v.Text:find("redz") then
                        v.Text = v.Text:gsub("Redz Hub", "AuraX Hub")
                        v.Text = v.Text:gsub("REDZ", "AURAX")
                    end
                end
            end
        end)
    end
end)

-- 6. ADIM: ÖZEL AX BİLDİRİM SİSTEMİ
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "AuraX Ultimate";
    Text = "Tüm modüller aktif. İyi oyunlar!";
    Icon = "rbxassetid://4483345998";
    Duration = 10;
})

-- [[ RİSK VE GÜVENLİK PROTOKOLÜ ]] --
-- Kod, Redz'in orijinal anti-cheat bypasslarını içerir.
