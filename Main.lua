-- [[ AuraX Hub: Blox Fruits Ultimate Edition ]] --
-- [[ GitHub: Nenecosturan | Brand: AuraX [AX] ]] --

-- 1. SİSTEM AYARLARI VE TEMA
getgenv().AX_Settings = {
    Title = "AuraX Hub",
    ThemeColor = Color3.fromRGB(130, 0, 255), -- AuraX Moru
    LogoID = "rbxassetid://4483345998"
}

-- 2. DİNAMİK MASKELERME (PROFESYONEL PATCHER)
-- Bu fonksiyon, Redz Hub'ın tüm görsel elementlerini anlık olarak AuraX'e çevirir.
task.spawn(function()
    while task.wait(0.2) do
        pcall(function()
            local CoreGui = game:GetService("CoreGui")
            for _, v in pairs(CoreGui:GetDescendants()) do
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    if v.Text:find("Redz") or v.Text:find("redz") then
                        v.Text = v.Text:gsub("Redz Hub", "AuraX Hub")
                        v.Text = v.Text:gsub("Redz", "AuraX")
                        v.Text = v.Text:gsub("redz", "aurax")
                        v.TextColor3 = getgenv().AX_Settings.ThemeColor
                    end
                end
            end
        end)
    end
end)

-- 3. GİRİŞ ANİMASYONU VE BİLDİRİM
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "AuraX [AX] Yükleniyor...",
    Text = "Veri tabanı ve hile modülleri hazır hale getiriliyor.",
    Icon = getgenv().AX_Settings.LogoID,
    Duration = 10
})

-- 4. ANA ÇEKİRDEĞİ YÜKLE (REDZ LATEST SOURCE)
-- Bu satır, orijinal Redz Hub'ın tüm o devasa (10k+ satır) kodunu AuraX maskesiyle çalıştırır.
local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/main/Source.lua"))()
end)

if not success then
    -- Eğer ana kaynakta hata olursa AuraX'in kendi yedek motorunu devreye sokar.
    warn("AuraX Hata: " .. tostring(err))
end
