# Lembar Kerja Peserta Didik (LKPD) - UKK TKJ 2026
## Paket 4: Implementasi Jaringan LAN

**Tujuan:** Siswa mampu merancang, membangun, dan menguji jaringan lokal (LAN) untuk kebutuhan kantor cabang kecil sesuai dengan standar industri.

---

### TAHAP I: PERENCANAAN & PERSIAPAN

#### 1. Analisis Kebutuhan Perangkat
Berdasarkan skenario, catat kebutuhan perangkat berikut:
- **Server:** 1 Unit (Penyimpanan data pusat)
- **Router:** 1 Unit (Gateway internet & DHCP Server)
- **Switch:** 2 Unit (Menghubungkan antar perangkat)
- **PC Client:** 8 Unit (Komputer karyawan)
- **Network Printer:** 1 Unit (Printer bersama)
- **Kabel:** UTP Cat 5e/6 & Konektor RJ-45

#### 2. Gambar Topologi (Star Topology)
Rancang topologi dengan struktur:
1.  **Internet** masuk ke **Router**.
2.  **Router** terhubung ke **Switch A**.
3.  **Switch A** menghubungkan Server, Printer, dan PC1.
4.  **Switch A** terhubung ke **Switch B** (Trunking/Uplink).
5.  **Switch B** menghubungkan PC2 sampai PC8.

---

### TAHAP II: IMPLEMENTASI FISIK (CABLING)

#### 1. Pembuatan Kabel Straight-Through (Standar T568B)
Urutan warna kabel pada kedua ujung (Kiri ke Kanan):
1. Putih Oranye
2. Oranye
3. Putih Hijau
4. Biru
5. Putih Biru
6. Hijau
7. Putih Cokelat
8. Cokelat

**Langkah Kerja:**
1. Kupas jaket kabel sekitar 2 cm.
2. Urutkan kabel sesuai standar T568B di atas.
3. Potong rata ujung kabel agar sejajar.
4. Masukkan ke konektor RJ-45 hingga menyentuh ujung.
5. Press menggunakan **Crimping Tool**.
6. Tes menggunakan **LAN Tester**. Pastikan lampu 1-8 menyala berurutan di kedua sisi.

---

### TAHAP III: KONFIGURASI JARINGAN & IP ADDRESSING

#### 1. Rencana Pengalamatan IP (Contoh)
Gunakan Network: `192.168.10.0/24`

| Nama Perangkat | IP Address | Subnet Mask | Gateway |
| :--- | :--- | :--- | :--- |
| Router (LAN) | 192.168.10.1 | 255.255.255.0 | - |
| Server | 192.168.10.10 | 255.255.255.0 | 192.168.10.1 |
| Printer | 192.168.10.20 | 255.255.255.0 | 192.168.10.1 |
| PC Client (1-8) | 192.168.10.31-38 | 255.255.255.0 | 192.168.10.1 |

#### 2. Langkah Konfigurasi (Windows/Linux)
1. Buka *Network & Sharing Center* > *Change Adapter Settings*.
2. Klik kanan pada *Ethernet* > *Properties* > *IPv4*.
3. Pilih "Use the following IP address" dan masukkan data sesuai tabel di atas.
4. Klik OK.

---

### TAHAP IV: PENGUJIAN & DOKUMENTASI

#### 1. Uji Konektivitas (Command Prompt)
Lakukan `ping` dari salah satu PC Client:
- `ping 192.168.10.1` (Cek koneksi ke Router/Gateway)
- `ping 192.168.10.10` (Cek koneksi ke Server)
- `ping 192.168.10.20` (Cek koneksi ke Printer)
- `ping [IP PC Lain]` (Cek koneksi antar PC)

#### 2. Troubleshooting (Jika Gagal)
- **Request Timed Out (RTO):** Periksa kabel (LAN Tester) atau pastikan Firewall Windows dalam kondisi non-aktif (saat ujian).
- **Destination Host Unreachable:** Periksa apakah alamat IP berada dalam satu subnet yang sama.
- **Kabel Putus:** Lakukan crimping ulang pada ujung konektor.

===
**Status Pekerjaan:** [ ] Selesai | [ ] Belum Selesai
**Tanda Tangan Penguji:** ____________________
