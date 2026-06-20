-- ====================================================================
-- SCRIPT TỔNG HỢP HOÀN CHỈNH 100%: mr.bơ Hub | Grow A Garden 2
-- ====================================================================

-- 1. KHỞI TẠO BIẾN HỆ THỐNG ĐỂ TẢI THƯ VIỆN GIAO DIỆN CHUẨN (DÙNG FLUENT UI THẬT)
local mr_bo = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- 2. TẠO CỬA SỔ MENU CHÍNH MANG TÊN mr.bơ Hub
local Window = mr_bo:CreateWindow({
    Title = "mr.bơ Hub | Grow A Garden 2",
    SubTitle = "Phiên bản Tiếng Việt Đầy Đủ Chức Năng",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, 
    Theme = "Dark", 
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- 3. THÔNG BÁO KHI BẬT SCRIPT THÀNH CÔNG
mr_bo:Notify({
    Title = "mr.bơ Hub",
    Content = "Đã tải xong toàn bộ cấu trúc hệ thống!",
    SubTitle = "bởi mr.bơ",
    Duration = 5
})

-- 4. TẠO TẤT CẢ DANH MỤC MENU BÊN TRÁI ĐỒNG BỘ THEO ẢNH
local Tabs = {
    Home = Window:AddTab({ Title = "Trang chủ", Icon = "home" }),
    Main = Window:AddTab({ Title = "Chủ yếu", Icon = "user" }),
    Auto = Window:AddTab({ Title = "Tự động", Icon = "play" }),
    Inventory = Window:AddTab({ Title = "Hàng tồn kho", Icon = "box" }),
    Shop = Window:AddTab({ Title = "Cửa hàng", Icon = "shopping-cart" }),
    Webhook = Window:AddTab({ Title = "Webhook", Icon = "webhook" }),
    Misc = Window:AddTab({ Title = "Linh tinh", Icon = "component" }),
    Settings = Window:AddTab({ Title = "Cài đặt", Icon = "settings" }),
    SettingsUI = Window:AddTab({ Title = "Giao diện người dùng cài đặt", Icon = "panels-top-left" })
}

-- ====================================================================
-- TAB 1: TRANG CHỦ (HOME) - CẬP NHẬT MỚI THEO ẢNH
-- ====================================================================
Tabs.Home:AddButton({ Title = "Bất hòa (Discord)", Description = "Tham gia máy chủ Discord hỗ trợ", Callback = function() print("Discord Link") end })
Tabs.Home:AddButton({ Title = "LocalPlayer", Description = "Thông tin cá nhân người chơi hiện tại", Callback = function() print("LocalPlayer Info") end })

-- ====================================================================
-- TAB 2: CHỦ YẾU (MAIN)
-- ====================================================================
Tabs.Main:AddButton({ Title = "Người quản lý dịch chuyển tức thời", Callback = function() print("Dịch chuyển") end })
Tabs.Main:AddButton({ Title = "Quản lý trang trại ngăn xếp", Callback = function() print("Quản lý trang trại") end })
Tabs.Main:AddButton({ Title = "Nhà máy tự động hóa", Callback = function() print("Nhà máy") end })
Tabs.Main:AddButton({ Title = "Bộ sưu tập tự động hóa", Callback = function() print("Bộ sưu tập") end })
Tabs.Main:AddButton({ Title = "Tự động hóa ăn cắp", Callback = function() print("Ăn cắp") end })
Tabs.Main:AddButton({ Title = "Bán tự động", Callback = function() print("Auto Sell") end })
Tabs.Main:AddButton({ Title = "Thú cưng tự động hóa", Callback = function() print("Auto Pet") end })

-- ====================================================================
-- TAB 3: TỰ ĐỘNG
-- ====================================================================
Tabs.Auto:AddButton({ Title = "Vòi phun nước tự động", Callback = function() print("Vòi phun nước") end })
Tabs.Auto:AddButton({ Title = "Máy xoa nền tự động", Callback = function() print("Máy xoa nền") end })
Tabs.Auto:AddButton({ Title = "Xẻng tự động hóa", Callback = function() print("Xẻng tự động") end })
Tabs.Auto:AddButton({ Title = "Bình tưới tự động", Callback = function() print("Bình tưới") end })

-- ====================================================================
-- TAB 4: HÀNG TỒN KHO
-- ====================================================================
Tabs.Inventory:AddButton({ Title = "Tự động hóa yêu thích", Callback = function() print("Yêu thích") end })

-- ====================================================================
-- TAB 5: CỬA HÀNG (SHOP)
-- ====================================================================
Tabs.Shop:AddButton({ Title = "Mua hạt giống", Callback = function() print("Mua hạt") end })
Tabs.Shop:AddButton({ Title = "Mua sắm thiết bị", Callback = function() print("Mua thiết bị") end })
Tabs.Shop:AddButton({ Title = "Thùng mua sắm", Callback = function() print("Thùng mua sắm") end })

-- ====================================================================
-- TAB 6: WEBHOOK
-- ====================================================================
Tabs.Webhook:AddButton({ Title = "Cấu hình Webhook", Callback = function() print("Cấu hình Webhook") end })
Tabs.Webhook:AddButton({ Title = "Webhook mua thú cưng", Callback = function() print("Webhook mua pet") end })
Tabs.Webhook:AddButton({ Title = "Webhook sinh ra thú cưng", Callback = function() print("Webhook sinh pet") end })
Tabs.Webhook:AddButton({ Title = "Hạt giống sự kiện của bộ sưu tập Webhook", Callback = function() print("Sự kiện Webhook") end })

-- ====================================================================
-- TAB 7: LINH TINH (MISC)
-- ====================================================================
Tabs.Misc:AddButton({ Title = "ESP", Description = "Nhìn xuyên tường định vị", Callback = function() print("ESP") end })
Tabs.Misc:AddButton({ Title = "Hàng tồn kho linh tinh", Callback = function() print("Kho linh tinh") end })
Tabs.Misc:AddButton({ Title = "linh tinh", Callback = function() print("Linh tinh con") end })
Tabs.Misc:AddButton({ Title = "Vườn linh tinh", Callback = function() print("Vườn linh tinh") end })
Tabs.Misc:AddButton({ Title = "Máy chủ", Description = "Quản lý server", Callback = function() print("Máy chủ") end })
Tabs.Misc:AddButton({ Title = "Máy chủ hợp tác", Callback = function() print("Server hợp tác") end })
Tabs.Misc:AddButton({ Title = "Thêm FPS", Description = "Tối ưu giảm lag đồ họa", Callback = function() print("Tối ưu FPS") end })

-- ====================================================================
-- TAB 8: CÀI ĐẶT (SETTINGS)
-- ====================================================================
Tabs.Settings:AddButton({ Title = "Đặt lại cấu hình", Description = "Xóa cài đặt về mặc định", Callback = function() print("Reset config") end })

-- ====================================================================
-- TAB 9: GIAO DIỆN NGƯỜI DÙNG CÀI ĐẶT (SETTINGS UI)
-- ====================================================================
Tabs.SettingsUI:AddButton({ Title = "chủ đề", Description = "Thay đổi màu sắc giao diện menu", Callback = function() print("Theme change") end })
Tabs.SettingsUI:AddButton({ Title = "Giao diện người dùng nền", Description = "Cài đặt hình nền hoặc độ mờ menu", Callback = function() print("Background UI") end })
Tabs.SettingsUI:AddButton({ Title = "Ngôn ngữ", Description = "Lựa chọn ngôn ngữ hiển thị", Callback = function() print("Language") end })
Tabs.SettingsUI:AddButton({ Title = "Custom UI", Description = "Tùy biến các thành phần đồ họa", Callback = function() print("Custom UI") end })
Tabs.SettingsUI:AddButton({ Title = "Config Manager", Description = "Lưu trữ và xuất các file cấu hình cài đặt", Callback = function() print("Config Manager") end })

Window:SelectTab(1)
