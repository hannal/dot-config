# Neovim

- 0.8+
- Mac OS X
- 참고/기반 설정 : [Josean Martinez](https://github.com/josean-dev/dev-environment-files)

## 플러그인

Packer를 사용함.

- `lua/hannal/plugins-setup.lua` : 사용할 플러그인을 정의. 파일이 변경되면 자동으로 플러그인을 설치/제거함.
- `lua/hannal/plugins/*` : 사용하는 플러그인 별 설정.
- `init.lua` : 플러그인 별 설정을 적재(load)하는 시작 script.

## 단축키

대부분 telescope command-center에 등록하고 사용. (`lua/hannal/plugins/telescope/command-center.lua`)

### 사전 지식

- `<leader>` : leader 키. 스페이스 바로 지정해놓음.
- `<C>` : ctrl.
- `<S>` : shift.
- `<M>` : meta key. 왼쪽 option key를 지정함. 사용하는 터미널 앱에서 별도 설정 필요.
- `<ESC>` : esc key.

```
<leader>eo : space bar -> e -> o
<C-w>v : ctrl+w -> v
```

Vi, Vim에는 여러 mode가 있는데, 일반(normal), 입력(insert), 명령(command), 비주얼(visual) 모드가 있다. 별도 표기가 없는 한 아래 단축키는 normal mode를 기본으로 한다.

### Vim built-in 단축키

- UI
  - `<C-w>` : window 관련
    - `<C-w>v` : 세로로 window 나누기.
    - `<C-w>s` : 가로로 window 나누기.
- Editing
  - `zf` : 선택한 block을 접기(folding, unfolding).
  - `zR` : 모든 접힌 구역을 펼침.
  - `zM` : 전 구역을 접음.
- Navigation
  - `/` : 정방향(forward) 검색.
    - `/hello` : 현 커서 위치 기준으로 정방향으로 `hello` 문자열 검색.
  - `?' : 역방향(backward) 검색.
    - `?hello` : 현 커서 위치 기준으로 역방향으로 `hello` 문자열 검색.
  - `n` : 다음 검색 위치로 이동.
  - `N` : 이전 검색 위치로 이동.
  - `<C-o>` : 다음 buffer로 이동.
  - `<C-i>` : 이전 buffer로 이동.
  - Bookmark
    - `m` : bookmark toggle 접두키.
      - `ma` : 현재 커서가 있는 위치를 `a`로 bookmark.
    - `` ` `` : bookmark 위치로 이동.
      - `` `a `` : bookmark `a`로 이동.
    - ` `` ` : 이전 bookmark 위치로 이동.

### 기본

- `<leader>nh` : highlighting 표시 지움.

### UI

- `<C-p>p` : 명령어 UI 호출. VSCode의 command pallette 같은 것.
  - `lua/hannal/plugins/telescope/command-center.lua`에 설정.
- Layout
  - `<leader>eo` : File explorer UI toggle.
  - `<leader>ee` : File explorer UI로 focus 이동.
  - `<leader>sm` : 현 window를 최대화 toggle.
  - `<leader>seh` : 현 layout의 width를 동일하게 맞춤.
  - `<leader>sev` : 현 layout의 height를 동일하게 맞춤.
  - `<C-w>=` : 현 layout의 width/height를 동일하게 맞춤.
- Tab
  - `<C-w>n` : 새 tab을 만듬.
  - `<C-w>c` : 현재 tab을 닫음.
  - `]t` : 다음 tab으로 이동.
  - `[t` : 이전 tab으로 이동.

### Navigation

- `<C-l>` : 오른쪽 window로 이동. `h`는 왼쪽, `j`는 아랫쪽, `k`는 윗쪽. `vim-tmux-navigator` plugin을 사용한 것.
- `zz` : 현재 커서를 화면 중앙에 보이게 조정.
- 선언부로 커서 이동.
  - neovim의 `ftplugin`의 python keymap과 혼선을 피하기 위해 ftplugin python keymap은 사용 안 함.
    - `lua/hannal/core/options.lua`에서 `vim.g.no_python_maps = true` 설정.
  - `]]` : class, function 선언부로 정방향 검색하여 이동.
  - `]c` : class 선언부로 정방향 검색하여 이동.
  - `[[` : class, function 선언부로 역방향 검색하여 이동.
  - `[c` : class 선언부로 역방향 검색하여 이동.
