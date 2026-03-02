# Panduan Konfigurasi IP - Ubuntu PC (Client)
## Pengaturan IP Statis Menggunakan Netplan

**Skenario:** Menyetel alamat IP statis untuk Ubuntu PC atau Server yang terhubung ke jaringan LAN Paket 4.

### 1. Masuk ke File Konfigurasi Netplan
Cari file konfigurasi YAML di direktori `/etc/netplan/`. Ketik perintah:
```bash
ls /etc/netplan/
```
*(Contoh file: `01-network-manager-all.yaml` atau `00-installer-config.yaml`)*.

### 2. Edit File Konfigurasi
Buka file YAML tersebut (gunakan editor teks `nano` atau `vi`):
```bash
sudo nano /etc/netplan/01-network-manager-all.yaml
```

### 3. Masukkan Konfigurasi IP Statis
Sesuaikan konfigurasi dengan format YAML berikut (perhatikan spasi):

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3: # Sesuaikan dengan nama interface kartu jaringan Anda (gunakan `ip addr`)
      dhcp4: no
      addresses:
        - 192.168.10.32/24
      routes:
        - to: default
          via: 192.168.10.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
```

### 4. Terapkan Konfigurasi
1. Simpan perubahan (tekan **Ctrl+O**, lalu **Enter**) dan keluar (**Ctrl+X**).
2. Terapkan konfigurasi netplan:
   ```bash
   sudo netplan apply
   ```

### 5. Verifikasi Koneksi
Cek alamat IP yang sudah diatur:
```bash
ip addr show enp0s3
```
*Pastikan alamat IP `192.168.10.32` sudah aktif di interface tersebut.*

### 6. Uji Ping
Lakukan ping ke Gateway atau PC lain:
```bash
ping 192.168.10.1
ping 192.168.10.10 # Ping ke Server
```
---
**Catatan:** Pastikan tidak ada kesalahan spasi dalam file YAML karena format ini sangat sensitif terhadap spasi/indentasi.
