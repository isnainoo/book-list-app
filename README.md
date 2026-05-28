# Flutter Book List App

A modern Flutter application for displaying a list of books with beautiful UI, search functionality, Hero animations, and detailed book pages.

---
Task Requirements

1. Buat project: book_list_app
✅ Selesai

2. Model Book: title, author, description, year
✅ Selesai

Model Book telah dibuat dengan properti:
title
author
description
year

File: lib/models/book.dart

3. HomePage: ListView.builder, 5 buku dummy
✅ Selesai

HomePage menggunakan:
ListView.builder
Data dummy buku
Modern UI card design

File: lib/pages/home_page.dart

Dummy data: lib/data/dummy_books.dart

4. Setiap ListTile onTap: Navigator.push ke DetailPage
✅ Selesai

Ketika card buku ditekan:
aplikasi berpindah ke halaman detail
menggunakan Navigator.push()

Implementasi:
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => DetailPage(
      book: book,
      heroIndex: index,
    ),
  ),
);

5. DetailPage terima Book via constructor
✅ Selesai

DetailPage menerima object Book melalui constructor.

Implementasi:

final Book book;

const DetailPage({
  super.key,
  required this.book,
  required this.heroIndex,
});

6. Tampilkan semua info buku di DetailPage
✅ Selesai

Halaman detail menampilkan:
Judul buku
Nama penulis
Tahun terbit
Deskripsi lengkap buku

Dengan UI:
Gradient header
Modern card
Shadow effect
Rounded design

⭐ Bonus: Hero pada icon buku list → detail
✅ Selesai

Hero animation berhasil diterapkan pada icon buku.
Implementasi:

Hero(
  tag: 'book-icon-$index',
)

Efek:

icon buku animasi smooth
transisi modern antar halaman

---
## 🔍 Search Feature

The app supports searching books based on:

* Book title
* Author name
* Book description

---


## 👨‍💻 Author

Developed by:
**Isna Choiron Nasikhin**
L200230037
Teknik Informatika — Universitas Muhammadiyah Surakarta
