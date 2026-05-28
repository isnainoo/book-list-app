import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../data/dummy_books.dart';
import '../models/book.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController =
  TextEditingController();

  List<Book> filteredBooks = dummyBooks;

  bool showSearchBar = true;

  // ================= SEARCH FUNCTION =================
  void searchBooks(String query) {
    final result = dummyBooks.where((book) {
      final title = book.title.toLowerCase();
      final author = book.author.toLowerCase();
      final description =
      book.description.toLowerCase();

      final input = query.toLowerCase();

      return title.contains(input) ||
          author.contains(input) ||
          description.contains(input);
    }).toList();

    setState(() {
      filteredBooks = result;
    });
  }

  void clearSearch() {
    searchController.clear();

    setState(() {
      filteredBooks = dummyBooks;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      // ================= APPBAR =================
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: 0,

        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),

              decoration: BoxDecoration(
                color:
                colorScheme.primary.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
              ),

              child: Icon(
                Icons.menu_book_rounded,
                color: colorScheme.primary,
                size: 24,
              ),
            ),

            const SizedBox(width: 14),

            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  "Daftar Buku",
                  style:
                  theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                Text(
                  "${filteredBooks.length} Buku Ditemukan",
                  style:
                  theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // ================= BODY =================
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction ==
              ScrollDirection.reverse) {
            // scroll ke bawah
            if (showSearchBar) {
              setState(() {
                showSearchBar = false;
              });
            }
          }

          if (notification.direction ==
              ScrollDirection.forward) {
            // scroll ke atas
            if (!showSearchBar) {
              setState(() {
                showSearchBar = true;
              });
            }
          }

          return true;
        },

        child: Column(
          children: [
            // ================= SEARCH BAR =================
            AnimatedContainer(
              duration:
              const Duration(milliseconds: 300),

              curve: Curves.easeInOut,

              height: showSearchBar ? 90 : 0,

              child: AnimatedOpacity(
                duration:
                const Duration(milliseconds: 250),

                opacity: showSearchBar ? 1 : 0,

                child: Padding(
                  padding:
                  const EdgeInsets.fromLTRB(
                      16, 8, 16, 14),

                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 58,

                          decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius:
                            BorderRadius.circular(
                                20),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.04),

                                blurRadius: 14,

                                offset:
                                const Offset(0, 5),
                              ),
                            ],
                          ),

                          child: TextField(
                            controller:
                            searchController,

                            onChanged:
                            searchBooks,

                            decoration:
                            InputDecoration(
                              hintText:
                              "Cari judul, penulis, deskripsi...",

                              hintStyle: TextStyle(
                                color: Colors
                                    .grey.shade500,
                              ),

                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: Colors
                                    .grey.shade600,
                              ),

                              suffixIcon:
                              searchController
                                  .text
                                  .isNotEmpty
                                  ? IconButton(
                                onPressed:
                                clearSearch,

                                icon: Icon(
                                  Icons
                                      .clear_rounded,

                                  color: Colors
                                      .grey
                                      .shade600,
                                ),
                              )
                                  : null,

                              border:
                              InputBorder.none,

                              contentPadding:
                              const EdgeInsets
                                  .symmetric(
                                vertical: 16,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // SEARCH BUTTON
                      GestureDetector(
                        onTap: () {
                          searchBooks(
                            searchController.text,
                          );
                        },

                        child: Container(
                          width: 58,
                          height: 58,

                          decoration: BoxDecoration(
                            gradient:
                            const LinearGradient(
                              colors: [
                                Color(0xFFFF7B00),
                                Color(0xFFFF5A00),
                              ],
                            ),

                            borderRadius:
                            BorderRadius.circular(
                                18),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange
                                    .withOpacity(0.35),

                                blurRadius: 12,

                                offset:
                                const Offset(0, 6),
                              ),
                            ],
                          ),

                          child: const Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ================= SEARCH RESULT =================
            if (searchController.text.isNotEmpty)
              Padding(
                padding:
                const EdgeInsets.symmetric(
                    horizontal: 18),

                child: Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    "Hasil pencarian untuk \"${searchController.text}\"",

                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 10),

            // ================= LIST =================
            Expanded(
              child: filteredBooks.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                physics:
                const BouncingScrollPhysics(),

                padding:
                const EdgeInsets.fromLTRB(
                    16, 4, 16, 20),

                itemCount:
                filteredBooks.length,

                itemBuilder:
                    (context, index) {
                  final Book book =
                  filteredBooks[index];

                  return _ModernBookCard(
                    book: book,
                    index: index,

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              DetailPage(
                                book: book,
                                heroIndex: index,
                              ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= EMPTY STATE =================
  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),

        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [
            Container(
              width: 110,
              height: 110,

              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                shape: BoxShape.circle,
              ),

              child: const Icon(
                Icons.search_off_rounded,
                size: 55,
                color: Colors.orange,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Buku Tidak Ditemukan",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Coba gunakan kata kunci lain\natau cari berdasarkan deskripsi buku.",

              textAlign: TextAlign.center,

              style: TextStyle(
                color: Colors.grey.shade600,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ModernBookCard extends StatelessWidget {
  final Book book;
  final int index;
  final VoidCallback onTap;

  const _ModernBookCard({
    required this.book,
    required this.index,
    required this.onTap,
  });

  static const List<Color> colors = [
    Color(0xFF6750A4),
    Color(0xFF2563EB),
    Color(0xFF0F766E),
    Color(0xFFEA580C),
    Color(0xFFDC2626),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = colors[index % colors.length];

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: InkWell(
        borderRadius: BorderRadius.circular(26),
        onTap: onTap,

        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),

          child: Padding(
            padding: const EdgeInsets.all(18),

            child: Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [
                // ================= ICON =================
                Hero(
                  tag: 'book-icon-$index',

                  child: Container(
                    width: 72,
                    height: 72,

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          accent,
                          accent.withOpacity(0.75),
                        ],
                      ),

                      borderRadius:
                      BorderRadius.circular(22),
                    ),

                    child: const Icon(
                      Icons.auto_stories_rounded,
                      color: Colors.white,
                      size: 34,
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // ================= CONTENT =================
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [
                      // TITLE
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              book.title,

                              style: theme
                                  .textTheme.titleMedium
                                  ?.copyWith(
                                fontWeight:
                                FontWeight.bold,
                                color: Colors.black87,
                                height: 1.2,
                              ),

                              maxLines: 2,
                              overflow:
                              TextOverflow.ellipsis,
                            ),
                          ),

                          const SizedBox(width: 10),

                          Container(
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),

                            decoration: BoxDecoration(
                              color:
                              accent.withOpacity(0.12),

                              borderRadius:
                              BorderRadius.circular(
                                  10),
                            ),

                            child: Text(
                              book.year.toString(),

                              style: TextStyle(
                                color: accent,
                                fontWeight:
                                FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // AUTHOR
                      Row(
                        children: [
                          Icon(
                            Icons.person_rounded,
                            size: 16,
                            color: accent,
                          ),

                          const SizedBox(width: 5),

                          Expanded(
                            child: Text(
                              book.author,

                              style: TextStyle(
                                color: accent,
                                fontWeight:
                                FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // DESCRIPTION
                      Text(
                        book.description,

                        maxLines: 3,

                        overflow:
                        TextOverflow.ellipsis,

                        style: TextStyle(
                          color: Colors.grey.shade700,
                          height: 1.5,
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 14),

                      // BUTTON
                      Container(
                        padding:
                        const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),

                        decoration: BoxDecoration(
                          color: accent,
                          borderRadius:
                          BorderRadius.circular(12),
                        ),

                        child: const Row(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            Text(
                              "Lihat Detail",

                              style: TextStyle(
                                color: Colors.white,
                                fontWeight:
                                FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),

                            SizedBox(width: 4),

                            Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}