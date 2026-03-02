# Panduan Konfigurasi Hotspot & RADIUS - Paket 4
## Manajemen Pengguna Jaringan Wireless

**Skenario:** Membuat layanan WiFi (Hotspot) yang menggunakan sistem login, di mana akun pengguna dikelola secara terpusat melalui RADIUS (User Manager).

---

### 1. Persiapan Interface Wireless
Pastikan interface `wlan1` sudah aktif dan memiliki SSID:
```bash
/interface wireless set [ find default-name=wlan1 ] ssid="Hotspot@SMK_NamaSiswa" mode=ap-bridge disabled=no
/ip address add address=192.168.20.1/24 interface=wlan1
```

---

### 2. Setup Hotspot (Langkah Cepat)
Jalankan wizard Hotspot melalui terminal:
```bash
/ip hotspot setup
# Select interface: wlan1
# Local address: 192.168.20.1/24
# Masquerade network: yes
# Address pool: 192.168.20.2-192.168.20.100
# Select certificate: none
# IP address of SMTP server: 0.0.0.0
# DNS Servers: 8.8.8.8, 8.8.4.4
# DNS Name: portal-smk.sch.id
# User: admin (password bebas)
```

---

### 3. Mengaktifkan RADIUS pada Hotspot
Agar Hotspot meminta data user dari server RADIUS:
1. Buka `IP` -> `Hotspot` -> `Server Profiles`.
2. Klik dua kali pada profil hotspot yang baru dibuat (misal: `hsprof1`).
3. Klik tab **RADIUS**, centang kotak **Use RADIUS**.
4. Klik **OK**.

---

### 4. Konfigurasi RADIUS Client
Menghubungkan Router ke sistem RADIUS internal (User Manager):
```bash
/radius add service=hotspot address=127.0.0.1 secret=password123
/radius incoming set accept=yes
```

---

### 5. Konfigurasi User Manager (RADIUS Server)
*Catatan: Pastikan paket `user-manager` sudah terinstal di MikroTik Anda (cek di System -> Packages).*

**Langkah di Browser (Akses ke http://IP-Router/userman):**
1. **Login:** Admin (tanpa password default).
2. **Routers:** Tambahkan router baru (Name: `Router1`, IP: `127.0.0.1`, Shared Secret: `password123`).
3. **Profiles:**
   - Buat Profile (misal: `Paket_Siswa`).
   - Tambahkan **Limitation** (misal: Rate Limit: `512k/512k`).
4. **Users:**
   - Gunakan menu **Add** -> **Batch**.
   - Number of users: `20`.
   - Username length: `5`.
   - Assign Profile: `Paket_Siswa`.

---

### 6. Pembatasan Waktu (Sesuai Soal)
Jika diminta membatasi waktu (misal: Jam 07:00 - 16:00), gunakan **Firewall Filter**:
```bash
/ip firewall filter add chain=forward action=drop src-address=192.168.20.0/24 time=16h-23h59m59s,sun,mon,tue,wed,thu,fri,sat
/ip firewall filter add chain=forward action=drop src-address=192.168.20.0/24 time=0s-6h59m59s,sun,mon,tue,wed,thu,fri,sat
```

---
**Tips Pengujian:**
- Coba hubungkan HP/Laptop ke SSID yang dibuat.
- Pastikan muncul halaman login (*Captive Portal*).
- Gunakan salah satu username dari User Manager untuk login.
- Cek status di menu `IP` -> `Hotspot` -> `Active`.
