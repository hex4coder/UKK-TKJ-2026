# Panduan Konfigurasi IP - Windows PC (Client)
## Pengaturan IP Statis & Verifikasi Koneksi

**Tujuan:** Memberikan alamat IP tetap (Static) pada komputer Windows karyawan sesuai dengan skema Paket 4.

### 1. Masuk ke Pengaturan Network
1. Tekan tombol **Windows + R**, ketik `ncpa.cpl` dan tekan **Enter**.
2. Klik kanan pada **Ethernet** (atau Local Area Connection), lalu pilih **Properties**.

### 2. Konfigurasi Protokol IPv4
1. Pilih **Internet Protocol Version 4 (TCP/IPv4)** dan klik **Properties**.
2. Pilih opsi **"Use the following IP address"**.
3. Masukkan data (contoh untuk PC 1):
   - **IP address:** `192.168.10.31`
   - **Subnet mask:** `255.255.255.0`
   - **Default gateway:** `192.168.10.1`
4. Pilih **"Use the following DNS server addresses"**:
   - **Preferred DNS server:** `8.8.8.8` (Google)
   - **Alternate DNS server:** `8.8.4.4`
5. Klik **OK** dan **Close**.

### 3. Verifikasi Konfigurasi (CMD)
1. Buka **Command Prompt** (Cari `cmd` di menu Start).
2. Ketik perintah:
   ```cmd
   ipconfig /all
   ```
   *Pastikan IPv4 Address, Subnet Mask, dan Default Gateway sudah benar.*

### 4. Uji Koneksi
1. Ping ke gateway:
   ```cmd
   ping 192.168.10.1
   ```
2. Ping ke PC lain (jika sudah diset):
   ```cmd
   ping 192.168.10.32
   ```
===
**Catatan:** Nonaktifkan sementara **Windows Firewall** atau beri izin untuk *ICMP (Ping)* agar tes koneksi tidak diblokir.
