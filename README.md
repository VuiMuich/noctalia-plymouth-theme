# noctalia-plymouth

Plymouth boot theme for [Noctalia](https://noctalia.dev).

![demo](demo.gif)

## Installation (NixOS with flakes)

Add the flake as an input:

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    noctalia-plymouth = {
      url = "github:VuiMuich/noctalia-plymouth";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
```

Enable the theme in your system configuration:

```nix
{ inputs, pkgs, ... }:
{
  boot.plymouth = {
    enable = true;
    theme = "noctalia";
    themePackages = [
      inputs.noctalia-plymouth.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
    font = "${pkgs.inter}/share/fonts/truetype/InterVariable.ttf";
  };
}
```

Plymouth only looks good if your GPU driver is loaded early. If the splash
doesn't show up, add it to `boot.initrd.kernelModules` (e.g. `amdgpu`, `i915`).

## Roadmap

- Improve the animation.
- This theme currently targets NixOS only. A more generic script and an
installer for other distributions may be added in the future.

## License

See [LICENSE](LICENSE).
