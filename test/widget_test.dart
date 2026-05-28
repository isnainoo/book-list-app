import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:book_list_app/main.dart';

void main() {
  testWidgets('HomePage menampilkan daftar buku', (WidgetTester tester) async {
    await tester.pumpWidget(const BookListApp());

    expect(find.text('Perpustakaan Buku'), findsOneWidget);
    expect(find.text('Bumi Manusia'), findsOneWidget);
    expect(find.text('Laskar Pelangi'), findsOneWidget);
  });
}
