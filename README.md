# 📚 Flutter Book List App

A modern Flutter application for displaying a collection of books with a beautiful UI, search functionality, Hero animations, and detailed book pages.

---

## ✨ Features

- 📖 Display book list using `ListView.builder`
- 🔍 Search books by:
  - Title
  - Author
  - Description
- 🎨 Modern and clean UI design
- 🚀 Smooth Hero animations
- 📄 Detailed book information page
- 📱 Responsive Flutter layout

---

# 📌 Task Requirements

## 1. Create Project: `book_list_app`
✅ Completed

---

## 2. Book Model
✅ Completed

The `Book` model contains:

- `title`
- `author`
- `description`
- `year`

📂 File:
```bash
lib/models/book.dart
```

---

## 3. HomePage with `ListView.builder`
✅ Completed

The `HomePage` includes:

- `ListView.builder`
- 5 dummy book data
- Modern card UI design

📂 Files:
```bash
lib/pages/home_page.dart
lib/data/dummy_books.dart
```

---

## 4. Navigation to DetailPage
✅ Completed

Each book card can be tapped to navigate to the detail page using `Navigator.push()`.

### Implementation
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => DetailPage(
      book: book,
      heroIndex: index,
    ),
  ),
);
```

---

## 5. DetailPage Receives Book via Constructor
✅ Completed

`DetailPage` receives a `Book` object through its constructor.

### Implementation
```dart
final Book book;

const DetailPage({
  super.key,
  required this.book,
  required this.heroIndex,
});
```

---

## 6. Display All Book Information
✅ Completed

The detail page displays:

- 📘 Book title
- ✍️ Author name
- 📅 Publication year
- 📝 Full description

### UI Features

- Gradient header
- Modern card design
- Shadow effects
- Rounded corners

---

# ⭐ Bonus Feature: Hero Animation
✅ Completed

Hero animation is implemented between the book icon in the list and the detail page.

### Implementation
```dart
Hero(
  tag: 'book-icon-$index',
)
```

### Result

- Smooth icon transition
- Modern page animation experience

---

# 🔍 Search Feature

The application supports searching books based on:

- Book title
- Author name
- Book description

---

# 🛠️ Technologies Used

- Flutter
- Dart
- Material Design

---

# 👨‍💻 Author

Developed by:

**Isna Choiron Nasikhin**  
L200230037  
Teknik Informatika — Universitas Muhammadiyah Surakarta

---


![Project Preview](https://github.com/isnainoo/photobooth-app/blob/main/photobooth-17685366141710.jpg)

![Project Preview](https://github.com/isnainoo/photobooth-app/blob/main/photobooth-17685366141710.jpg)

![Project Preview](https://github.com/isnainoo/photobooth-app/blob/main/photobooth-17685366141710.jpg)

![Project Preview](https://github.com/isnainoo/photobooth-app/blob/main/photobooth-17685366141710.jpg)
