# Panduan Konfigurasi MikroTik - Paket 4
## Implementasi Gateway & LAN

**Skenario:** Router bertindak sebagai gateway internet dan memberikan layanan IP ke seluruh jaringan LAN.

### 1. Masuk ke MikroTik
Gunakan aplikasi **Winbox**, hubungkan ke router via MAC Address (Neighbor tab).

### 2. Konfigurasi IP Address (CLI/Terminal)
Buka menu `New Terminal` dan ketik perintah berikut:

```bash
# Menambahkan IP ke interface yang terhubung ke Internet (ISP)
/ip address add address=192.168.1.2/24 interface=ether1

# Menambahkan IP ke interface yang terhubung ke LAN (Switch)
/ip address add address=192.168.10.1/24 interface=ether2
```

### 3. Konfigurasi Gateway (Default Route)
Agar router bisa mengakses internet:
```bash
/ip route add gateway=192.168.1.1
```

### 4. Konfigurasi DNS
Agar router bisa menerjemahkan domain (seperti google.com):
```bash
/ip dns set servers=8.8.8.8,8.8.4.4 allow-remote-requests=yes
```

### 5. Konfigurasi NAT (Masquerade)
Agar client di LAN bisa akses internet menggunakan IP Router:
```bash
/ip firewall nat add chain=srcnat out-interface=ether1 action=masquerade
```

### 6. Konfigurasi DHCP Server (Opsional/Sesuai Soal)
Jika diminta memberikan IP otomatis ke PC Client:
```bash
/ip pool add name=pool-lan ranges=192.168.10.31-192.168.10.38
/ip dhcp-server add interface=ether2 address-pool=pool-lan disabled=no
/ip dhcp-server network add address=192.168.10.0/24 gateway=192.168.10.1 dns-server=8.8.8.8
```
===
**Catatan:** Pastikan kabel dari ISP terpasang di `ether1` dan kabel ke Switch terpasang di `ether2`.
