program tubes;
uses crt;
//kamus untuk login
const
password = 'rahasiadong';
User = 'satpam_keren';

//kamus untuk program
type Data_Tamu = record //ini untuk rekursif filenya
	keterangan : string;
	nama1,tp,kamar1: string;
end;
type Data_komplain = record
	kamar3,nama3,komplain : string;
end;
type penghuni = record
	nama4,kamar4,keterangan2 : string;
end;
type Data_penghuni = record
		kamar2,nama2 : string;
end;

var arsip : file of Data_Tamu;
arsip1 : file of Data_penghuni;
arsip2 : file of Data_komplain;
D2: array[1..10] of Data_komplain;
D : array[1..10] of  Data_Tamu;
D1:  array[1..10] of Data_penghuni;
cari,u,p : string;
menu,pil : integer;
balik,lagi : char;
j,i,ii,n : integer;

//untuk komplain
procedure komplain;
begin
textbackground(white);
clrscr;
textcolor(cyan);
gotoxy(25,5);write('Input data komplain');
writeln;
textcolor(green);
gotoxy(20,8);writeln('=====================================');
textcolor(red);
gotoxy(25,11);writeln('tekan enter untuk melanjutkan');
readln;

clrscr;
textcolor(cyan);
assign(arsip2, 'data/Data_komplain.dat');
reset(arsip2);
seek(arsip2, filesize(arsip2));
write(' Input banyak  komplain: ');
readln(n);
writeln(' ----------------------------------');
for i:=filesize(arsip2)+1 to filesize(arsip2) + n do
begin
textbackground(white);
textcolor(cyan);
write('> Masukkan Nama : ');
readln(d2[i].nama3);
write('> Masukkan No.kamar : ');
readln(d2[i].kamar3);
write('>Komplain Apaan: ');
readln(d2[i].komplain);
writeln(' ----------------------------------');
write(arsip2, d2[i]);
end;
end;

//menu untuk menginput data penghuni
procedure program1;
begin
textbackground(white);
clrscr;
textcolor(cyan);
gotoxy(25,5);write('Input data penghuni asrama');
writeln;
textcolor(green);
gotoxy(20,8);writeln('=====================================');
textcolor(red);
gotoxy(25,11);writeln('tekan enter untuk melanjutkan');
readln;

//untuk menginput penghuni asrama
clrscr;
textcolor(cyan);
assign(arsip1, 'data/Data_penghuni.dat');
reset(arsip1);
seek(arsip1, filesize (arsip1));
write(' Input Banyak Penghuni : ');
readln(n);
writeln(' ----------------------------------');
for i:=filesize (arsip1)+1 to filesize (arsip1) + n do
begin
textbackground(white);
textcolor(cyan);
write('> Masukkan Nama : ');
readln(d1[i].nama2);
write('> Masukkan No.kamar : ');
readln(d1[i].kamar2);
writeln(' ----------------------------------');
write(arsip1, d1[i]);
end;

//tabelnya
clrscr;
gotoxy(20,3);writeln(' >>> TABEL DATA PENGHUNI ASRAMA <<<');
writeln;
textcolor(green);
writeln('====================================');
writeln('| NO |      NAMA     | Nomer Kamar |');
writeln('====================================');
textcolor(black);
reset(arsip1);
i:=1;
while not eof(arsip1) do
begin
textbackground(white);
read(arsip1,d1[i]);
writeln('|', i:3 , d1[i].nama2:12 , d1[i].kamar2:12 ,'       |');
writeln('====================================');
inc(i);
end;
close(arsip1);
readln;
end;


//input data tamu
procedure tamu;
begin
textbackground(white);
clrscr;
assign(arsip, 'data/Data_tamu.dat');
reset(arsip);
textcolor(magenta);
writeln('Tolong isi buku  tamu');
textcolor(black);
writeln(' --------------------------------------------------------------------');
writeln(' --------------------------------------------------------------------');
for i:=filesize (arsip)+1 to filesize (arsip) + 1 do
begin
textcolor(cyan);
write('> Masukkan Nama                         : ');
readln(d[i].nama1);
write('> Masukkan kamar tujuan: ');
readln(d[i].kamar1);
write('> Keterangan: ');
readln(d[i].keterangan);
write('> No. Tanda Pengenal (ktp/sim/ktm)    : ');
readln(d[i].tp);
textcolor(black);
writeln(' --------------------------------------------------------------------');
writeln(' --------------------------------------------------------------------');
write(arsip,d[i]);
end;
end;


//menu bantuan
procedure bantuan;
begin
textbackground(white);
clrscr;
gotoxy(1,4);writeln('================================================================================');
gotoxy(1,6);writeln('================================================================================');
gotoxy(1,19);writeln('================================================================================');
gotoxy(1,21);writeln('================================================================================');
textcolor(black);
gotoxy(32,5);writeln('BANTUAN');
textcolor(yellow);
gotoxy(1,7);writeln('boro-boro bantu, saya juga bingung kenapa kodingan ini jalan');
gotoxy(28,8);writeln('wkwkwkwk');
textcolor(blue);
gotoxy(10,11);writeln('	butuh jasa ngoding?');
gotoxy(10,12);writeln('	kodingan error?');
gotoxy(10,13);writeln('	dikodein wanita tapi kurang peka?');
textcolor(black);
gotoxy(10,15);writeln('email saja ke:');
textcolor(green);
gotoxy(25,16);writeln('> new.fazzafakhri@gmail.com <');
textcolor(yellow);
gotoxy(1,9);writeln('mohon maaf yang sebesar-besarnya kalau error dan program kurang kece badai');
end;


//menu tentang e-Satpam
procedure tentang;
begin
textbackground(white);
clrscr;
textcolor(green);
gotoxy(1,4);writeln('================================================================================');
gotoxy(1,6);writeln('================================================================================');
gotoxy(1,18);writeln('================================================================================');
gotoxy(1,21);writeln('================================================================================');
textcolor(black);
gotoxy(32,5);writeln('Tentang Program Ini');
gotoxy(30,13);writeln('Program Ini Disusun Oleh :');
textcolor(blue);
gotoxy(38,14);writeln('	Fazza Fakhri R');
gotoxy(38,15);writeln('	Pramudya Adi N');
gotoxy(38,16);writeln('	Rayhan Asprilia');
gotoxy(38,17);writeln('	Yogathama Arif K');
textcolor(yellow);
gotoxy(12,7);writeln('Program ini dibuat untuk memenuhi nilai tugas besar Matakuliah AlPro');
gotoxy(12,8);writeln('Program ini adalah program e-Satpam');
gotoxy(12,9);writeln('dibuat guna mempermudah satpam mendata segala aktivitas penghuni');
gotoxy(12,10);writeln('Jika banyak kesalahan kami mohon maaf yang sebesar-besarnya');
end;

//ini bakal menanyakan apakah akan keluar dari program atau tidak
procedure tanya;
begin
textcolor(red);
gotoxy(24,20);write('Apakah Anda Ingin Keluar? [y/n] : ');
readln(balik);
end;
procedure tanya2;
begin
textcolor(red);
gotoxy(24,20);write('Apakah Anda Ingin Kembali ke menu awal? [y/n] : ');
readln(balik);
end;

//prosedur edit data
procedure program6;
begin
assign(arsip1, 'data/Data_penghuni.dat');
reset(arsip1);
write('Data yang akan di edit: ');readln(cari);
i:=1;
while not (eof(arsip1)) do
	begin
textbackground(white);
read(arsip1,d1[i]);
if (d1[i].nama2=cari) then ii:=i;
inc(i);
end;
writeln;
writeln('Nama awal: ',d1[ii].nama2);
writeln('Kamar awal',d1[ii].kamar2);
seek(arsip1, ii-1);
writeln;
write('Nama baru:');readln(d1[ii].nama2);
write('Kamar baru:');readln(d1[ii].kamar2);
write(arsip1, d1[ii]);
readln;
close(arsip1);
end;

//procedure cari penghuni
procedure cari1;
begin
textbackground(white);
assign(arsip1, 'data/Data_penghuni.dat');
reset(arsip1);
write('Data yang ingin dicari: ');readln(cari);
i:=1;
while not (eof(arsip1)) and (cari<>d1[i].nama2) do
	begin
read(arsip1,d1[i]);
inc(i);
end;
if (cari=d1[i].nama2) then
	begin
textbackground(white);
clrscr;
gotoxy(20,3);writeln(' >>> TABEL DATA PENGHUNI ASRAMA <<<');
writeln;
textcolor(green);
writeln('====================================');
writeln('| NO |      NAMA     | Nomer Kamar |');
writeln('====================================');
textcolor(black);
writeln('|', i:3 , d1[i].nama2:12 , d1[i].kamar2:12 ,'       |');
writeln('====================================');
end;
close(arsip1);
readln;
end;

//procedure hapus data
procedure hapus;
begin
textbackground(white);
assign(arsip1, 'Data_penghuni.dat');
reset(arsip1);
write('Data yang ingin dihapus:');
readln(cari);
i:=1;
while not (eof(arsip1)) and (cari<>d1[i].nama2) do
	begin
textbackground(white);
read(arsip1,d1[i]);
inc(i);
end;
if (cari=d1[i].nama2) then
	begin
//geser data
seek(arsip1, i-1);
for j:=i to filesize(arsip1) do
begin
d1[j].nama2:= d1[i+1].nama2;
d1[j].kamar2:=d1[i+1].kamar2;
write(arsip1, d1[j]);
inc(i);
end;
seek(arsip1, filesize(arsip1)-1);
truncate(arsip1);
readln;
end;

clrscr;
gotoxy(20,3);writeln(' >>> TABEL DATA PENGHUNI ASRAMA <<<');
writeln;
textcolor(green);
writeln('====================================');
writeln('| NO |      NAMA     | Nomer Kamar |');
writeln('====================================');
textcolor(black);
reset(arsip1);
i:=1;
while not eof(arsip1) do
begin
read(arsip1,d1[i]);
writeln('|', i:3 , d1[i].nama2:12 , d1[i].kamar2:12 ,'       |');
writeln('====================================');
inc(i);
end;
close(arsip1);
readln;
end;



//keluar otomatis ditambah animasi
procedure keluar;
var
teks : string[30];
posisiKar : integer;
x,y : integer;

begin
textbackground(white);
clrscr;
textcolor(red);
teks := 'Terimakasih, Dadahhhhh :*';

x := 25;
y := 3;
textcolor(green);
gotoxy(35, 1);write(':: Penutup ::');

for posisiKar := 1 to length(teks) do
begin
textcolor(yellow);
gotoxy(x,3);write(teks[posisiKar]);
delay(20);
x := x + 1;
end;

x := 25;

//animasi vertical
for posisiKar := 1 to length(teks) do
begin
for y := 3 to 17 do
begin
textcolor(magenta);
gotoxy(x, y); write(teks[posisiKar]);
textcolor(cyan);
gotoxy(x, y - 1); write('Byee');
delay(20);
gotoxy(1,1);
end;

x := x + 1;
delay(20);
end;
 halt(0);
readkey;
end;

//ini jika pas login benar semua (password dan usernamenya)
procedure benar;
begin
if u=user then
begin
if p=password then
begin
textbackground(white);
clrscr;
textcolor(green);
gotoxy(24,8);writeln('=====================================');
gotoxy(24,14);writeln('=====================================');
textcolor(magenta);
gotoxy(35,10);writeln('BERHASIL LOGIN');
textcolor(blue);
GOTOXY(24,5);WRITELN('=====================================');
GOTOXY(28,6);WRITELN('SELAMAT DATANG, ',USER,'!');
GOTOXY(24,7);WRITELN('=====================================');
textcolor(red);
gotoxy(23,12);write('Langsung masuk ke menu tekan enter saja');
readln;
clrscr;
balik:='n';
while balik='n' do

//ini menu setelah login
begin
textbackground(white);
clrscr;
textcolor(green);
gotoxy(24,1);writeln('=====================================');
gotoxy(24,3);writeln('=====================================');
gotoxy(24,21);writeln('=====================================');
gotoxy(24,23);writeln('=====================================');
textcolor(cyan);
gotoxy(34,22);writeln('PROGRAM e-SATPAM V.1');
gotoxy(35,2);writeln('Menu Program');
gotoxy(24,4);writeln('1. Input/tambah penghuni asrama');
gotoxy(24,6);writeln('2. Cari kamar berdasarkan nama ');
gotoxy(24,8);writeln('3. Hapus data');
gotoxy(24,10);writeln('4. edit');
gotoxy(24,12);writeln('5. Lihat Komplain');
gotoxy(24,14);writeln('6. Buku Tamu');
gotoxy(24,16);writeln('0. Kembali ke menu utama');
textcolor(blue);
gotoxy(24,20);write('Masukkan Pilihan Menu [1-7 dan 0] : ');
readln(menu);
clrscr;

//daftar isi menu agar berjalan dalam program
case menu of
1 : begin
program1;
tanya;
end;
2 : begin
cari1;
tanya;
end;
3 : begin
hapus;
tanya;
end;
4 : begin
program6;
tanya;
end;
5 : begin
textbackground(white);
//tabelnya
clrscr;
assign(arsip2,'data/Data_komplain.dat');
reset(arsip2);
gotoxy(20,3);writeln(' >>> TABEL DATA PENGHUNI ASRAMA <<<');
writeln;
textcolor(green);
writeln('========================================================================');
writeln('| NO |      NAMA     | Nomer Kamar |             Komplain              |');
writeln('========================================================================');
textcolor(black);
reset(arsip2);
i:=1;
while not eof(arsip2) do
begin
read(arsip2,d2[i]);
writeln('|', i:3 , d2[i].nama3:12 , d2[i].kamar3:12 , d2[i].komplain:12, '       |');
writeln('========================================================================');
inc(i);
end;
close(arsip2);
readln;
tanya;
end;
6 : begin
textbackground(white);
clrscr;
assign(arsip, 'data/Data_tamu.dat');
reset(arsip);
textcolor(magenta);
writeln(' Data  tamu ');
textcolor(black);
writeln(' --------------------------------------------------------------------');
writeln(' --------------------------------------------------------------------');
reset(arsip);
i := 1;

while not eof(arsip) do
begin
read(arsip, d[i]);
writeln('nama: ',d[i].nama1);
writeln('kamar tujuan: ',d[i].kamar1);
writeln('keterangan: ',d[i].keterangan);
writeln('tanda pengenal(ktp/ktm/sim): ',d[i].tp);
writeln(' --------------------------------------------------------------------');
writeln(' --------------------------------------------------------------------');
inc(i);
end;
close(arsip);
readln;
tanya;
end;

0 : begin
tanya2;
end;
//ini jika salah memasukan nomer yang tidak terdaftar di menu program
7..10 : begin
textcolor(green);
gotoxy(22,8);writeln('=======================================');
textcolor(red);
gotoxy(22,9);writeln('Menu Yang Anda Masukkan Tidak Terdaftar');
textcolor(cyan);
gotoxy(22,10);writeln('=======================================');
tanya;
end;
end;
end;
end

//di program ini akan memberitahu jika password dan username salah. jika username salah ia hanya akan memberi tahu usernamenya salah begitupun sebaliknya
//jika password salah
else if p<>password then
begin
textbackground(white);
clrscr;
textcolor(green);
gotoxy(20,8);writeln('==========================================');
gotoxy(20,16);writeln('==========================================');
textcolor(red);
gotoxy(35,7);writeln('PASSWORD SALAH!');
gotoxy(25,11);writeln('Password Yang Anda Masukkan Salah!');
textcolor(cyan);
gotoxy(30,13);write('Mau Coba Lagi? [y/n]');
readln(lagi);
readln;
end;
end;
end;

//jika username salah
procedure salah;
begin
if u<>user then
begin
textbackground(white);
clrscr;
textcolor(green);
gotoxy(20,8);writeln('==========================================');
gotoxy(20,16);writeln('==========================================');
textcolor(red);
gotoxy(33,7);writeln('USERNAME SALAH!');
gotoxy(28,10);writeln(' Username Tidak Terdaftar');
textcolor(cyan);
gotoxy(32,13);write('Mau Coba Lagi? [y/n]');
readln(lagi);
end;
end;
procedure login;
begin
clrscr;
lagi:='y';
while lagi='y' do
Begin
textbackground(white);
clrscr;
textcolor(green);
gotoxy(24,1);writeln('=====================================');
gotoxy(24,3);writeln('=====================================');
gotoxy(24,21);writeln('=====================================');
gotoxy(24,23);writeln('=====================================');
textcolor(cyan);
gotoxy(34,22);writeln('PROGRAM e-SATPAM V.1');
gotoxy(35,2);writeln('Menu Program');
gotoxy(24,4);writeln('1. Log-In Admin');
gotoxy(24,6);writeln('2. User');
gotoxy(24,8);writeln('3. Tentang Program');
gotoxy(24,10);writeln('4. Bantuan');
gotoxy(24,12);writeln('5. Exit');
gotoxy(24,20);write('input pilihan: ');readln(pil);
case pil of
1 : begin
textbackground(white);
clrscr;
textcolor(green);
gotoxy(20,8);writeln('==========================================');
gotoxy(20,16);writeln('==========================================');
textcolor(red);
gotoxy(30,7);writeln('LOGIN TERLEBIH DAHULU');
textcolor(cyan);
gotoxy(25,10);write('Masukkan Username : ');readln(u);
gotoxy(25,13);write('Masukkan Password : ');readln(p);
benar;
salah;
end;
2: begin
begin
textbackground(white);
clrscr;
textcolor(green);
gotoxy(24,1);writeln('=====================================');
gotoxy(24,3);writeln('=====================================');
gotoxy(24,21);writeln('=====================================');
gotoxy(24,23);writeln('=====================================');
textcolor(cyan);
gotoxy(34,22);writeln('PROGRAM e-SATPAM V.1');
gotoxy(35,2);writeln('Menu Program');
gotoxy(24,4);writeln('1. Data Tamu');
gotoxy(24,6);writeln('2. Cari kamar berdasarkan nama ');
gotoxy(24,8);writeln('3. Komplain');
gotoxy(24,10);writeln('0. kembali ke menu utama');

textcolor(blue);
gotoxy(24,20);write('Masukkan Pilihan Menu [0-3] : ');
readln(menu);
clrscr;

//daftar isi menu agar berjalan dalam program
case menu of
1 : begin
tamu;
tanya;
end;
2 : begin
cari1;
tanya;
end;
3 : begin
komplain;
tanya;
end;
0 : begin
tanya2;
end;


//ini jika salah memasukan nomer yang tidak terdaftar di menu program
4..10 : begin
textbackground(white);
textcolor(green);
gotoxy(22,8);writeln('=======================================');
textcolor(red);
gotoxy(22,9);writeln('Menu Yang Anda Masukkan Tidak Terdaftar');
textcolor(cyan);
gotoxy(22,10);writeln('=======================================');
tanya;
end;
end;
end;
end;

3 : begin
tentang;
tanya;
end;
4 : begin
Bantuan;
tanya;
end;
5 : begin;
keluar;
end;

end;
end;
end;
begin
assign(arsip1,'data/Data_penghuni.dat');
{$i-}
reset(arsip1);
{$i+}
if IOresult<>0 then rewrite(arsip1);
	close(arsip1);
login;
begin
assign(arsip,'data/Data_tamu.dat');
{$i-}
reset(arsip);
{$i+}
if IOresult<>0 then rewrite(arsip);
	close(arsip);
login;
end;
begin
assign(arsip2,'data/Data_komplain.dat');
{$i-}
reset(arsip2);
{$i+}
if IOresult<>0 then rewrite(arsip2);
	close(arsip2);
login;
end;
end.
