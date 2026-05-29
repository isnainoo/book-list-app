# 📚 Flutter Book List App
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
---

# 👨‍💻 Author

Developed by:

**Isna Choiron Nasikhin**  
L200230037  
Teknik Informatika — Universitas Muhammadiyah Surakarta

---




![Project Preview](https://github.com/isnainoo/book-list-app/blob/main/Screenshot_20260528_160523.png)

![Project Preview](https://github.com/isnainoo/book-list-app/blob/main/Screenshot_20260528_160533.png)

![Project Preview](https://github.com/isnainoo/book-list-app/blob/main/Screenshot_20260528_160548.png)

![Project Preview](https://github.com/isnainoo/book-list-app/blob/main/Screenshot_20260528_160557.png)
