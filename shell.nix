{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.pandoc
  ];

  shellHook = ''
    echo "Nix-shell aktif! Gunakan perintah berikut untuk konversi:"
    echo "pandoc LKPD-P4.md SETTING-MIKROTIK.md SETTING-WINDOWS.md SETTING-UBUNTU.md SETTING-HOTSPOT-RADIUS.md -o PANDUAN-LENGKAP-UKK-TKJ-P4.docx"
  '';
}
