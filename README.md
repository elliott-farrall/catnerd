<h3 align="center">
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="100" alt="Logo"/><br/>
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
	<a href="https://github.com/ElliottSullingeFarrall/catnerd">CatNerd</a>
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
</h3>

<p align="center">
	<a href="https://github.com/ElliottSullingeFarrall/catnerd/stargazers"><img src="https://img.shields.io/github/stars/ElliottSullingeFarrall/catnerd?colorA=363a4f&colorB=b7bdf8&style=for-the-badge"></a>
	<a href="https://github.com/ElliottSullingeFarrall/catnerd/issues"><img src="https://img.shields.io/github/issues/ElliottSullingeFarrall/catnerd?colorA=363a4f&colorB=f5a97f&style=for-the-badge"></a>
	<a href="https://github.com/ElliottSullingeFarrall/catnerd/contributors"><img src="https://img.shields.io/github/contributors/ElliottSullingeFarrall/catnerd?colorA=363a4f&colorB=a6da95&style=for-the-badge"></a>
</p>

<p align="center">
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/previews/preview.webp"/>
</p>

## Previews

<details>
<summary>🌻 Latte</summary>
<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/previews/latte.webp"/>
</details>
<details>
<summary>🪴 Frappé</summary>
<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/previews/frappe.webp"/>
</details>
<details>
<summary>🌺 Macchiato</summary>
<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/previews/macchiato.webp"/>
</details>
<details>
<summary>🌿 Mocha</summary>
<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/previews/mocha.webp"/>
</details>

## Modules List

The following is a list of supported and planned modules.

#### NixOS

- [ ] Console
- [x] Font
- [ ] GTK
- [x] GRUB
- [x] KMScon
- [x] Plymouth
- [x] TTY
- [ ] SDDM

#### Home-Manager

- [x] Alacritty
- [ ] Bat
- [ ] Btop
- [ ] CAVA
- [x] Cursor
- [ ] Delta
- [ ] Dunst
- [ ] FCITX5
- [ ] Fish
- [x] Foot
- [ ] Fzf
- [ ] GH-Dash
- [ ] GitUI
- [ ] Glamour
- [x] GTK
- [ ] Helix
- [x] Hyprland
- [x] Hyprlock
- [ ] IMV
- [ ] K9s
- [x] Kitty
- [ ] Kvantum
- [ ] LazyGit
- [ ] Mako
- [ ] Micro
- [ ] MPV
- [ ] NeoVim
- [ ] NewsBoat
- [ ] Polybar
- [x] QT
- [ ] Rio
- [x] Rofi
- [ ] Skim
- [x] Starship
- [ ] Sway
- [ ] Swaylock
- [x] Sway Notification Center
- [ ] Tmux
- [ ] Tofi
- [x] Waybar
- [x] WezTerm
- [x] Xresources
- [ ] Yazi
- [ ] Zathura
- [ ] Zellij
- [x] ZSH-Syntax-Highlighting 

## Usage

1. Include the input in your flake:
    ```nix
    inputs = {
        ...
        catnerd.url = "github:ElliottSullingeFarrall/catnerd";
        ...
    }
    ```
2. In your outputs include the NixOS and home-manager modules:
    ```nix
    outputs = { self, home-manager, catnerd, ... }: {
        nixosConfigurations.machine = lib.nixosSystem rec {
            ...
            modules = [
                home-manager.nixosModules.home-manager {
                    home-manager = {
                        ...
                        sharedModules = [ inputs.catnerd.homeManagerModules.catnerd ];
                        ...
                    };
                }
                inputs.catnerd.nixosModules.catnerd
            ];
            ...
    }
    ```
3. In both nixos and home-manager you can configure `catnerd` like
    ```nix
    catnerd = {
        enable = true;

        flavour = "macchiato";
        accent = "pink";

        cursor.size = 24;

        fonts = {
          main = {
            family = "Ubuntu";
            size = 10;
          };
          mono = {
            family = "DroidSansM";
            size = 14;
          };
        };
      };
    ```

## To Do

### Fonts

Use [font data](https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/data/fonts/nerd-fonts/manifests/fonts.json) to auto-populate options.

### Testing

Implement better testing methods that use all possible options combinations.

<!-- this section is optional -->
<!-- 
## 🙋 FAQ

-	Q: **_"Where can I find the doc?"_**\
	A: Run `:help theme`

## 💝 Thanks to

- [Human](https://github.com/catppuccin)
 -->

&nbsp;

<!-- 
<p align="center">
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" />
</p>

<p align="center">
	Copyright &copy; 2021-present <a href="https://github.com/catppuccin" target="_blank">Catppuccin Org</a>
</p>

<p align="center">
	<a href="https://github.com/catppuccin/catppuccin/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a>
</p>
 -->
