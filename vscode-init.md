# vscode - windows 版本介紹

## 1. vscode 下載位置
https://code.visualstudio.com/Download

symbol: ← ↑ → ↓ ↔ ↕ ↖ ↗ ↘ ↙

## 2. 常用操作

編輯模式 | 按鍵 | 備註
--- | --- | ---
終端模式  | `Ctrl`  +  ` | terminal 打開終端
指令模式  | `Ctrl`  +  `p` | pannel 打開指令
指令模式* | `Ctrl`  +  `p` + `> keyboard Shortcuts File`| 設定 熱鍵 
指令模式* | `Ctrl`  +  `p` + `> user setting`| 設定 user IDE
指令模式  | `Ctrl`  +  `p` + `> compaire`| 比對差異
指令模式  | `Ctrl`  +  `p` + `> sort`| 選取排序
指令模式  | `Ctrl`  +  `p` + `:` + 123 | 游標跳行123
指令模式  | `Ctrl`  +  `g` + 123 | 游標跳行123

## 3. 修改IDE預設檔

### 3.1 編輯 Keyboard Shortcuts File 
- 控制快鍵  Ctrl  +  p  輸入  >  Keyboard Shortcuts File 

修改成以下內容

``` js
[
    {
        "key": "ctrl+alt+m",
        "command": "editor.action.formatDocument",
        "when": "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly"
    },
    {
        "key": "ctrl+alt+f",
        "command": "editor.action.formatSelection",
        "when": "editorHasDocumentSelectionFormattingProvider && editorHasSelection && editorTextFocus && !editorReadonly"
    },
    {
        "key": "ctrl+x",
        "command": "workbench.action.terminal.kill",
        "when": "terminalFocus"
    },
    {
        "key": "ctrl+pageup",
        "command": "workbench.action.terminal.focusNext",
        "when": "terminalFocus"
    },
    {
        "key": "ctrl+pagedown",
        "command": "workbench.action.terminal.focusPrevious",
        "when": "terminalFocus"
    }
]
```
### 3.2 編輯 User setting
- 控制設定  Ctrl  +  p  輸入  >  User setting

```js
{
    "editor.minimap.enabled": false,
    "window.zoomLevel": 0,
    "editor.fontSize": 12,
    "editor.mouseWheelZoom": true,
    "python.linting.enabled": false,
    "files.eol": "\n",
    "workbench.iconTheme": "vscode-icons",
    "workbench.editor.enablePreview": false,
    "workbench.editor.enablePreviewFromQuickOpen": false,
    "vsicons.projectDetection.disableDetect": true,
    "files.autoGuessEncoding": true,
    "files.exclude": {
        "**/.gitignore":false,
        "**/.git": true,
        "**/.svn": true,
        "**/.hg": true,
        "**/CVS": true,
        "**/.DS_Store": true,
        "**/*.pyc":true,
        "**/.*":true,
    },
    "editor.rulers": [
        80,
        120
    ],
    // "editor.detectIndentation": false,
    "editor.stablePeek": true,
    "terminal.integrated.shell.windows": "C:\\Program Files\\Git\\bin\\bash.exe",
    "terminal.integrated.scrollback": 5000,
    "sublimeTextKeymap.promptV3Features": true,
    "editor.multiCursorModifier": "ctrlCmd",
    "editor.snippetSuggestions": "top",
    "editor.formatOnPaste": true,
    "extensions.ignoreRecommendations": true,
    "git.ignoreLegacyWarning": true,
    "workbench.sideBar.location": "right",
    "banner-comments.h1": "ANSI Shadow",
    "banner-comments.h2": "Slant",
    "banner-comments.h3": "Doom",
    "csv-preview.separator": ";",
    "csv-preview.resizeColumns": "all",
    "markdown-preview-enhanced.previewTheme": "none.css",
    "python.pythonPath": "C:\\Users\\USER\\AppData\\Local\\Programs\\Python\\Python38-32\\python.exe",
}
```

## 4. 推薦安裝套件

套件名稱 | 項目() 
--- | ---
(heyimfuzz.banner-comments) |- [高亮大字區塊](https://marketplace.visualstudio.com/items?itemName=heyimfuzz.banner-comments)
(grapecity.gc-excelviewer) |- [文檔表格預覽 ](https://marketplace.visualstudio.com/items?itemName=GrapeCity.gc-excelviewer)
(slevesque.vscode-hexdump) |- [十六進位文檔 ](https://marketplace.visualstudio.com/items?itemName=slevesque.vscode-hexdump)
(ms-python.python) |- [PY語法高亮 ](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
(ms-vscode-remote.remote-ssh) |- [SSH遠端連線 ](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)
(ms-vscode-remote.remote-ssh-edit) |- [SSH遠端管理 ](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh-edit)
(ms-vscode.sublime-keybindings) |- [sublime 按鍵對應](https://marketplace.visualstudio.com/items?itemName=ms-vscode.sublime-keybindings)
(redhat.vscode-yaml) |- [yaml語法高亮 ](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)


## 5. 常用終端操作

編輯模式 | 按鍵 | 備註
--- | --- | ---
終端模式  | `Ctrl`  +  ` | terminal 開關終端
終端模式  | `Ctrl`  +  `~` | 新增分頁
終端模式  | `Ctrl`  +  `x` | 關閉分頁
終端模式  | `Ctrl`  +  `pageUp` | 切換分頁
終端模式  | `Ctrl`  +  `pageDn` | 切換分頁


## 6. 常用編輯操作

編輯模式 | 按鍵 | 備註
--- | --- | ---
編輯模式  | `Ctrl`  +  `w`              | 關閉分頁 window
編輯模式  | `Ctrl`  +  `o`              | 開啟檔案 open
編輯模式  | `Ctrl`  +  `n`              | 新增分頁 new
編輯模式  | `Ctrl`  +  `a`              | 選擇全部 all
編輯模式  | `Ctrl`  +  `s`              | 儲存分頁 save
編輯模式  | `Ctrl`  +  `f`              | 尋找單字 find
編輯模式  | `Ctrl`  +  `h`              | 取代單字 replace
編輯模式  | `Ctrl`  +  `j`              | 刪除結尾 trim
編輯模式  | `Ctrl`  +  `k`              | 第二指令
編輯模式  | `Ctrl`  +  `l`              | 選下一行 line 
編輯模式  | `Ctrl`  +  `z`              | 回上一步 undo
編輯模式  | `Ctrl`  +  `x`              | 刪除一行 
編輯模式  | `Ctrl`  +  `b`              | 打開檔案 browser
編輯模式  | `Ctrl`  +  `/`              | 註解一行 comment
編輯模式  | `Ctrl`  +  `pageUp`         | 切換分頁
編輯模式  | `Ctrl`  +  `pageDn`         | 切換分頁
編輯模式  | `Ctrl`  +  `Alt`  +  `m`    | 全文排版
編輯模式  | `Ctrl`  +  `Alt`  +  `f`    | 選擇排版 format
編輯模式  | `Ctrl`  +  `d`    | 游標下個單字 
編輯模式  | `Home`  + `Shift` +  `End`  | 選擇整行
編輯模式  | `End`   + `Shift` +  `Home` | 選取整行2
編輯模式  | `Ctrl`  + `Shift` +  `↑` / `↓`  | 移動整行
編輯模式  | `Alt`   + `Shift` +  `↑` / `↓`  | 選取列
編輯模式  | `Ctrl`  + `Shift` +  `←` / `→`  | 選取單字


## 7. 套件 Banner 推薦字體

● ANSI Shadow
```sh
#  █████╗ ███╗   ██╗███████╗██╗    ███████╗██╗  ██╗ █████╗ ██████╗  ██████╗ ██╗    ██╗
# ██╔══██╗████╗  ██║██╔════╝██║    ██╔════╝██║  ██║██╔══██╗██╔══██╗██╔═══██╗██║    ██║
# ███████║██╔██╗ ██║███████╗██║    ███████╗███████║███████║██║  ██║██║   ██║██║ █╗ ██║
# ██╔══██║██║╚██╗██║╚════██║██║    ╚════██║██╔══██║██╔══██║██║  ██║██║   ██║██║███╗██║
# ██║  ██║██║ ╚████║███████║██║    ███████║██║  ██║██║  ██║██████╔╝╚██████╔╝╚███╔███╔╝
# ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚═╝    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  ╚═════╝  ╚══╝╚══╝
```
● Slant
```sh
#   _____ __            __
#  / ___// /___ _____  / /_
#  \__ \/ / __ `/ __ \/ __/
# ___/ / / /_/ / / / / /_
#/____/_/\__,_/_/ /_/\__/
```
● 3D-ascii
```sh
# ________  ________                 ________  ________  ________  ___  ___
#|\_____  \|\   ___ \               |\   __  \|\   ____\|\   ____\|\  \|\  \
#\|____|\ /\ \  \_|\ \  ____________\ \  \|\  \ \  \___|\ \  \___|\ \  \ \  \
#      \|\  \ \  \ \\ \|\____________\ \   __  \ \_____  \ \  \    \ \  \ \  \
#     __\_\  \ \  \_\\ \|____________|\ \  \ \  \|____|\  \ \  \____\ \  \ \  \
#    |\_______\ \_______\              \ \__\ \__\____\_\  \ \_______\ \__\ \__\
#    \|_______|\|_______|               \|__|\|__|\_________\|_______|\|__|\|__|
#                                                \|_________|
```
