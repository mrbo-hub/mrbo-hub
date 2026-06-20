--!strict

-- ====================================================================
-- 1. HỆ THỐNG KIỂM TRA ID GAME TỰ ĐỘNG (MR.BƠ HUB LOADER)
-- ====================================================================
local HttpGet = game.HttpGet
local GameId: number = game.GameId

local Success, Games = pcall(function()
    return loadstring(HttpGet(game, "https://githubusercontent.com"))() :: any
end)

if not Success or not Games then
    warn("Không thể tải danh sách kiểm tra trò chơi từ máy chủ của mr.bơ Hub!")
    return
end

local URL: string? = Games[GameId]
if not URL then 
    warn("Trò chơi hiện tại (ID: " .. tostring(GameId) .. ") không nằm trong danh sách hỗ trợ của mr.bơ Hub!")
    return 
end

-- ====================================================================
-- 2. KHỔI TẠO THƯ VIỆN GIAO DIỆN CHUẨN (MR.BƠ HUB) -> ĐÃ THAY THẾ Ở ĐÂY
-- ====================================================================
local UI_Success, mr_bo = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/mrbo-hub/mrbo-hub/refs/heads/main/mrbo.lua", true))()
end)

if not UI_Success or not mr_bo then
    warn("Lỗi: Không thể khởi chạy thư viện UI từ đường dẫn mrbo.lua của bạn!")
    return
end

-- TẠO CỬA SỔ MENU CHÍNH MANG TÊN mr.bơ Hub
local Window = mr_bo:CreateWindow({
    Title = "mr.bơ Hub | Grow A Garden 2",
    SubTitle = "Phiên bản Tiếng Việt Đầy Đủ Chức Năng",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, 
    Theme = "Dark", 
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- THÔNG BÁO KHI BẬT SCRIPT THÀNH CÔNG
mr_bo:Notify({
    Title = "mr.bơ Hub",
    Content = "Đã kết nối máy chủ và xây dựng cấu trúc menu thành công!",
    SubTitle = "bởi mr.bơ",
    Duration = 5
})

-- ====================================================================
-- 3. TẠO DANH MỤC MENU (TABS) BÊN TRÁI ĐÃ CHUẨN HÓA TIẾNG VIỆT
-- ====================================================================
local Tabs = {
    Home = Window:AddTab({ Title = "Trang chủ", Icon = "home" }),
    Main = Window:AddTab({ Title = "Chức năng chính", Icon = "user" }),
    Auto = Window:AddTab({ Title = "Tự động hóa", Icon = "play" }),
    Inventory = Window:AddTab({ Title = "Túi đồ", Icon = "box" }),
    Shop = Window:AddTab({ Title = "Cửa hàng", Icon = "shopping-cart" }),
    Webhook = Window:AddTab({ Title = "Webhook Discord", Icon = "webhook" }),
    Misc = Window:AddTab({ Title = "Tính năng phụ", Icon = "component" }),
    Settings = Window:AddTab({ Title = "Cấu hình", Icon = "settings" }),
    SettingsUI = Window:AddTab({ Title = "Cài đặt menu UI", Icon = "panels-top-left" })
}

-- ====================================================================
-- TAB 1: TRANG CHỦ (HOME)
-- ====================================================================
Tabs.Home:AddButton({ Title = "Tham gia Discord", Description = "Nhận liên kết tham gia máy chủ Discord hỗ trợ công cụ", Callback = function() print("Discord Link") end })
Tabs.Home:AddButton({ Title = "Thông tin tài khoản", Description = "Hiển thị dữ liệu người chơi cục bộ hiện tại", Callback = function() print("LocalPlayer Info") end })

-- ====================================================================
-- TAB 2: CHỨC NĂNG CHÍNH (MAIN)
-- ====================================================================
Tabs.Main:AddButton({ Title = "Quản lý dịch chuyển tức thời", Callback = function() print("Dịch chuyển") end })
Tabs.Main:AddButton({ Title = "Gom cụm trang trại (Stack Farm)", Callback = function() print("Quản lý trang trại") end })
Tabs.Main:AddButton({ Title = "Tự động vận hành nhà máy", Callback = function() print("Nhà máy") end })
Tabs.Main:AddButton({ Title = "Tự động thu gom bộ sưu tập", Callback = function() print("Bộ sưu tập") end })
Tabs.Main:AddButton({ Title = "Tự động nhặt / Thu hoạch ké", Callback = function() print("Ăn cắp") end })
Tabs.Main:AddButton({ Title = "Tự động bán nông sản", Callback = function() print("Auto Sell") end })
Tabs.Main:AddButton({ Title = "Tự động tương tác thú cưng", Callback = function() print("Auto Pet") end })

-- ====================================================================
-- TAB 3: TỰ ĐỘNG HÓA (AUTO)
-- ====================================================================
Tabs.Auto:AddButton({ Title = "Tự động bật vòi phun nước", Callback = function() print("Vòi phun nước") end })
Tabs.Auto:AddButton({ Title = "Tự động dùng bay tôn (Trowel)", Callback = function() print("Máy xoa nền") end })
Tabs.Auto:AddButton({ Title = "Tự động sử dụng xẻng", Callback = function() print("Xẻng tự động") end })
Tabs.Auto:AddButton({ Title = "Tự động dùng bình tưới cây", Callback = function() print("Bình tưới") end })

-- ====================================================================
-- TAB 4: TÚI ĐỒ (INVENTORY)
-- ====================================================================
Tabs.Inventory:AddButton({ Title = "Tự động thêm vào mục yêu thích", Callback = function() print("Yêu thích") end })

-- ====================================================================
-- TAB 5: CỬA HÀNG (SHOP)
-- ====================================================================
Tabs.Shop:AddButton({ Title = "Tự động mua hạt giống", Callback = function() print("Mua hạt") end })
Tabs.Shop:AddButton({ Title = "Tự động mua sắm trang bị", Callback = function() print("Mua thiết bị") end })
Tabs.Shop:AddButton({ Title = "Tự động mua thùng đồ (Crates)", Callback = function() print("Thùng mua sắm") end })

-- ====================================================================
-- TAB 6: WEBHOOK DISCORD
-- ====================================================================
Tabs.Webhook:AddButton({ Title = "Cấu hình liên kết Webhook", Callback = function() print("Cấu hình Webhook") end })
Tabs.Webhook:AddButton({ Title = "Webhook thông báo mua thú cưng", Callback = function() print("Webhook mua pet") end })
Tabs.Webhook:AddButton({ Title = "Webhook thông báo ấp nở thú cưng", Callback = function() print("Webhook sinh pet") end })
Tabs.Webhook:AddButton({ Title = "Webhook báo sự kiện hạt giống", Callback = function() print("Sự kiện Webhook") end })

-- ====================================================================
-- TAB 7: TÍNH NĂNG PHỤ (MISC)
-- ====================================================================
Tabs.Misc:AddButton({ Title = "Kích hoạt định vị ESP", Description = "Nhìn xuyên tường định vị người chơi / vật phẩm", Callback = function() print("ESP") end })
Tabs.Misc:AddButton({ Title = "Quản lý kho đồ linh tinh", Callback = function() print("Kho linh tinh") end })
Tabs.Misc:AddButton({ Title = "Tính năng phụ khác", Callback = function() print("Linh tinh con") end })
Tabs.Misc:AddButton({ Title = "Quản lý tiện ích khu vườn", Callback = function() print("Vườn linh tinh") end })
Tabs.Misc:AddButton({ Title = "Danh sách máy chủ", Description = "Quản lý và duyệt danh sách server", Callback = function() print("Máy chủ") end })
Tabs.Misc:AddButton({ Title = "Kết nối máy chủ hợp tác", Callback = function() print("Server hợp tác") end })
Tabs.Misc:AddButton({ Title = "Tối ưu hóa FPS", Description = "Giảm cấu hình đồ họa để tăng tốc game, giảm lag", Callback = function() print("Tối ưu FPS") end })

-- ====================================================================
-- TAB 8: CẤU HÌNH (SETTINGS)
-- ====================================================================
Tabs.Settings:AddButton({ Title = "Đặt lại cấu hình mặc định", Description = "Xóa toàn bộ cài đặt hiện tại về ban đầu", Callback = function() print("Reset config") end })

-- ====================================================================
-- TAB 9: CÀI ĐẶT MENU UI (SETTINGS UI)
-- ====================================================================
Tabs.SettingsUI:AddButton({ Title = "Giao diện (Themes)", Description = "Thay đổi màu sắc chủ đạo của bảng menu", Callback = function() print("Theme change") end })
Tabs.SettingsUI:AddButton({ Title = "Nền menu (Background UI)", Description = "Cài đặt hình nền hoặc độ làm mờ menu", Callback = function() print("Background UI") end })
Tabs.SettingsUI:AddButton({ Title = "Ngôn ngữ hệ thống", Description = "Lựa chọn ngôn ngữ hiển thị chính", Callback = function() print("Language") end })
Tabs.SettingsUI:AddButton({ Title = "Tùy biến UI (Custom UI)", Description = "Tự do chỉnh sửa các thành phần đồ họa", Callback = function() print("Custom UI") end })
Tabs.SettingsUI:AddButton({ Title = "Quản lý tệp cấu hình (Config)", Description = "Lưu trữ, sao lưu và xuất các file cài đặt cá nhân", Callback = function() print("Config Manager") end })

Window:SelectTab(1)

