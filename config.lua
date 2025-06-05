local wezterm=require 'wezterm'
local config=wezterm.config_builder()

-- 颜色配置
config.color_scheme='tokyonight_moon'
config.window_decorations="RESIZE"
config.use_fancy_tab_bar=false
config.hide_tab_bar_if_only_one_tab=false

config.inactive_pane_hsb={
    saturation=0.9,
    brightness=0.8,
}

-- 设置字体和窗口大小
config.font = wezterm.font('Maple Mono NF CN', {
    weight="Medium", -- <-- Change from "Regular" to "Medium"
    stretch='Normal',
    style='Normal'
})
config.font_size=16
config.initial_cols=80
config.initial_rows=50

-- 设置shell

config.default_prog={"nu.exe"}


--键盘绑定
local act=wezterm.action

config.keys={
    -- Ctrl+p 显示启动菜单
    {key='p',mods='CTRL',action=act.ShowLauncherArgs{flags='FUZZY|TABS|LAUNCH_MENU_ITEMS'}},
    --F11 全屏
    {key='F11',mods='NONE',action=act.ToggleFullScreen},
    -- Ctrl+Shift+ 字体增大
    {key='+',mods='SHIFT|CTRL',action=act.IncreaseFontSize},
    -- Ctrl+Shift- 字体减少
    {key='-',mods='SHIFT|CTRL',action=act.DecreaseFontSize},
    -- Ctrl+t 创建新标签
    {key='t',mods='CTRL',action=act.ShowLauncher},
    --Ctrl+w 关闭标签
    {key='w',mods='CTRL',action=act.CloseCurrentTab{confirm=false}},
    -- Ctrl + Shift + 上箭头 垂直分屏
    {key='UpArrow',mods='SHIFT|CTRL',action=act({SplitHorizontal={domain='CurrentPaneDomain'}})},
    -- Ctrl +Shift+下箭头 水平分屏
    {key='DownArrow',mods='SHIFT|CTRL',action=act({SplitVertical={domain='CurrentPaneDomain'}})},

    {key='LeftArrow',mods='CTRL',action=act.ActivatePaneDirection 'Left'},
    {key='RightArrow',mods='CTRL',action=act.ActivatePaneDirection 'Right'},
    {key='UpArrow',mods='CTRL',action=act.ActivatePaneDirection 'Up'},
    {key='DownArrow',mods='CTRL',action=act.ActivatePaneDirection 'Down'},

    --粘贴
    {key='v',mods='CTRL',action=act.PasteFrom'Clipboard'},
}

-- 鼠标绑定
config.mouse_bindings={
    -- copy
    {
        event={Up={streak=1,button='Left'}},
        mods='NONE',
        action=act.CompleteSelection 'ClipboardAndPrimarySelection',
    },
    -- 打开链接
    {
        event={Up={streak=1,button='Left'}},
        mods='NONE',
        action=act.OpenLinkAtMouseCursor,
    },
}

return config


