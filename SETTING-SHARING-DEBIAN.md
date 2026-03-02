# Panduan Sharing File & Printer - Debian 13
## Konfigurasi Samba & CUPS Server

**Tujuan:** Menggunakan Debian 13 sebagai server file sharing (Samba) dan printer sharing (CUPS) yang bisa diakses oleh client Windows/Linux.

---

### 1. Instalasi Samba & CUPS
Jalankan perintah berikut di terminal Debian:
```bash
sudo apt update && sudo apt install samba cups -y
```

---

### 2. Konfigurasi Sharing File (Samba)
1. **Buat Folder Sharing:**
   ```bash
   sudo mkdir -p /srv/sharing/DATA_UKK
   sudo chmod -R 777 /srv/sharing/DATA_UKK
   ```
2. **Edit Konfigurasi Samba:**
   ```bash
   sudo nano /etc/samba/smb.conf
   ```
3. **Tambahkan Konfigurasi di Akhir File:**
   ```ini
   [DATA_UKK]
   path = /srv/sharing/DATA_UKK
   writable = yes
   browsable = yes
   guest ok = yes
   read only = no
   ```
4. **Restart Samba:**
   ```bash
   sudo systemctl restart smbd nmbd
   ```

> ![Samba Config File](https://linuxhint.com/wp-content/uploads/2021/08/samba-linux-debian-smb-conf-1024x600.png)

---

### 3. Konfigurasi Sharing Printer (CUPS)
1. **Izinkan Akses Network pada CUPS:**
   ```bash
   sudo nano /etc/cups/cupsd.conf
   ```
2. **Ubah Konfigurasi Berikut:**
   - Cari `Listen localhost:631` ubah menjadi `Listen *:631`.
   - Di bagian `<Location />`, tambahkan baris `Allow @LOCAL`.
   - Di bagian `<Location /printers>`, tambahkan baris `Allow @LOCAL`.
3. **Restart CUPS:**
   ```bash
   sudo systemctl restart cups
   ```
4. **Setup via Browser:**
   Buka browser di PC lain dan ketik: `http://[IP_DEBIAN]:631`.
   Tambahkan printer melalui menu **Administration**.

> ![CUPS Web Admin](https://www.cups.org/images/cups.png)

---

### 4. Cara Mengakses dari Client Windows
Di File Explorer Windows, ketik alamat IP Debian:
`\192.168.10.11` (Sesuaikan dengan IP Debian Server Anda).
Anda akan melihat folder `DATA_UKK` dan printer yang telah dibagikan.

===
**Catatan:** Pastikan Firewall pada Debian (UFW/Iptables) tidak memblokir port 139, 445 (Samba) dan 631 (CUPS).
