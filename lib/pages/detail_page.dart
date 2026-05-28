import 'package:flutter/material.dart';
import '../models/book.dart';

class DetailPage extends StatelessWidget {
  final Book book;
  final int heroIndex;

  const DetailPage({
    super.key,
    required this.book,
    required this.heroIndex,
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
    final accent = colors[heroIndex % colors.length];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),

        slivers: [
          // APP BAR
          SliverAppBar(
            expandedHeight: 340,
            pinned: true,
            elevation: 0,
            backgroundColor: accent,
            foregroundColor: Colors.white,

            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,

              title: Text(
                book.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      accent,
                      accent.withOpacity(0.75),
                    ],
                  ),
                ),

                child: Stack(
                  children: [
                    Positioned(
                      top: -60,
                      right: -40,
                      child: Container(
                        width: 220,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.08),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: -40,
                      left: -30,
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: 'book-icon-$heroIndex',
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(32),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                  width: 1.5,
                                ),
                              ),
                              child: const Icon(
                                Icons.auto_stories_rounded,
                                size: 60,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 32),
                            child: Text(
                              book.title,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.18),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.person_rounded,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  book.author,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
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

          // CONTENT
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 30),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // INFO CARD
                  Container(
                    padding: const EdgeInsets.all(22),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),

                    child: Row(
                      children: [
                        Expanded(
                          child: _ModernInfoItem(
                            icon: Icons.person_rounded,
                            title: "Penulis",
                            value: book.author,
                            color: accent,
                          ),
                        ),

                        Container(
                          height: 60,
                          width: 1,
                          color: Colors.grey.shade300,
                        ),

                        Expanded(
                          child: _ModernInfoItem(
                            icon: Icons.calendar_month_rounded,
                            title: "Tahun",
                            value: book.year.toString(),
                            color: accent,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 26),

                  // DESKRIPSI TITLE
                  Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: accent.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          Icons.description_rounded,
                          color: accent,
                        ),
                      ),

                      const SizedBox(width: 14),

                      Text(
                        "Deskripsi Buku",
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // DESKRIPSI CARD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),

                    child: Text(
                      book.description,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.8,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 58,

                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),

                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),

                      label: const Text(
                        "Kembali ke Daftar Buku",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: accent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ModernInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _ModernInfoItem({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 54,
          height: 54,

          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(18),
          ),

          child: Icon(
            icon,
            color: color,
            size: 28,
          ),
        ),

        const SizedBox(height: 14),

        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 13,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}