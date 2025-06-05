# wezterm 配置说明

本仓库包含一份针对 [WezTerm](https://wezfurlong.org/wezterm/) 终端模拟器的详细配置文件（`wezterm.lua`），适用于 Windows 平台，具有个性化的配色、字体、启动 shell 及常用键盘/鼠标绑定。下文将逐项介绍各配置项的作用。

---

## 主要特性

- **配色方案**：使用 `tokyonight_moon`，提供良好的视觉对比与护眼效果。
- **窗口装饰**：允许窗口大小调整。
- **标签栏**：采用简洁风格，并且即使只有一个标签页时也会显示标签栏。
- **非激活窗格亮度调整**：降低未激活窗格的亮度和饱和度，突出当前窗格。
- **字体设置**：使用 `Maple Mono NF CN`，适合中英文混排，字号为 16。
- **初始窗口大小**：80 列 x 50 行。
- **默认 Shell**：启动时运行 Nushell（需用户本地已安装）。
- **键盘绑定**：
  - 启动菜单、全屏、字体缩放、标签与窗格的管理等操作均有便捷快捷键支持。
- **鼠标绑定**：
  - 左键单击可复制选中内容或打开链接。

---

## 详细配置项说明

### 1. 颜色与窗口样式

```lua
config.color_scheme = 'tokyonight_moon'
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
}
```

- 采用 `tokyonight_moon` 主题。
- 启用窗口调整大小。
- 使用简洁风格标签栏，并始终显示。

### 2. 字体与窗口尺寸

```lua
config.font = wezterm.font('Maple Mono NF CN', {
    weight = "Medium",
    stretch = 'Normal',
    style = 'Normal'
})
config.font_size = 16
config.initial_cols = 80
config.initial_rows = 50
```

- 使用适合编程的可变宽字体，字号较大，适合长时间阅读。

### 3. 默认 Shell

```lua
config.default_prog = {"nu.exe"}
```

- 以 Nushell 作为默认 shell。若无须此功能，可自行修改为 cmd、powershell 或 bash 等。

### 4. 键盘绑定

常用快捷键如下（部分示例）：

- `Ctrl + p`：显示启动菜单
- `F11`：切换全屏
- `Ctrl + Shift + +`：增大字体
- `Ctrl + Shift + -`：减小字体
- `Ctrl + t`：新建标签页
- `Ctrl + w`：关闭当前标签页
- `Ctrl + Shift + ↑`：垂直分屏
- `Ctrl + Shift + ↓`：水平分屏
- `Ctrl + 方向键`：切换窗格
- `Ctrl + v`：粘贴

### 5. 鼠标绑定

- 左键单击：复制选中内容，或打开链接

---

## 使用方法

1. **安装 WezTerm**  
   参考官方文档: https://wezfurlong.org/wezterm/install/

2. **下载字体**  
   推荐使用 [Maple Mono NF CN](https://github.com/subframe7536/Maple-font) 字体，并安装到系统。

3. **配置文件放置**  
   将本目录下的 `wezterm.lua` 复制到你的 WezTerm 配置目录（通常为 `C:\Users\用户名\.wezterm.lua` 或 `~/.wezterm.lua`）。

4. **按需修改**  
   - 若 Nushell 路径不同，请修改 `config.default_prog` 为本机实际路径。
   - 如需更换字体或配色，可在相应配置项调整。

---

## 参考

- [WezTerm 官方文档](https://wezfurlong.org/wezterm/)
- [Nushell](https://www.nushell.sh/)
- [Maple Mono 字体](https://github.com/subframe7536/Maple-font)
- [tokyonight 主题](https://github.com/folke/tokyonight.nvim)

---

如有疑问或建议，欢迎提 issue 讨论！
