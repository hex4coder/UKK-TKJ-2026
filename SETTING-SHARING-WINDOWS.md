# Panduan Sharing File & Printer - Windows 11
## Berbagi Sumber Daya di Jaringan Lokal

**Tujuan:** Mengkonfigurasi Windows 11 agar dapat berbagi folder dan printer dengan perangkat lain dalam satu LAN.

---

### 1. Persiapan: Mengaktifkan Network Discovery
Agar PC Anda terlihat oleh perangkat lain:
1. Buka **Settings** > **Network & Internet**.
2. Pilih **Advanced network settings** > **Advanced sharing settings**.
3. Pastikan **Private networks** memiliki:
   - **Network discovery:** ON.
   - **File and printer sharing:** ON.
4. Di bagian **All networks**, disarankan mematikan **Password protected sharing** jika hanya untuk keperluan ujian agar akses lebih mudah.

---

### 2. Sharing Folder (File Sharing)
1. Klik kanan pada folder yang ingin dibagikan (misal: "DATA_SISWA").
2. Pilih **Properties** > tab **Sharing** > klik tombol **Share...**.
3. Pilih **Everyone** dari dropdown, klik **Add**.
4. Ubah Permission Level menjadi **Read/Write**.
5. Klik **Share**, lalu **Done**.
6. Klik **Advanced Sharing...**, centang **Share this folder**, lalu klik **OK**.

> ![Ilustrasi Menu Sharing Windows 11](https://www.windowscentral.com/sites/wpcentral.com/files/styles/large/public/field/image/2021/10/windows-11-file-sharing-properties.jpg)

---

### 3. Sharing Printer
1. Buka **Settings** > **Bluetooth & devices** > **Printers & scanners**.
2. Pilih printer yang terpasang, klik **Printer properties**.
3. Buka tab **Sharing**, centang **Share this printer**.
4. Beri nama sharing (misal: `Printer_Ujian`), lalu klik **OK**.

> ![Ilustrasi Sharing Printer Windows 11](https://www.elevenforum.com/attachments/share_printer-png.10651/)

---

### 4. Cara Mengakses dari Client
Di PC lain, buka File Explorer dan ketik alamat IP server di address bar:
`\192.168.10.10` (Sesuaikan dengan IP Windows Server Anda).
Semua folder dan printer yang dibagikan akan muncul di sana.

===
**Catatan:** Pastikan Windows Firewall tidak memblokir "File and Printer Sharing".
