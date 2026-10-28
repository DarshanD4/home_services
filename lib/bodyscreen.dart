import 'homecarousel.dart';

import 'package:flutter/material.dart';

class Bodyhome extends StatefulWidget {
  const Bodyhome({super.key});

  @override
  State<Bodyhome> createState() => _BodyhomeState();
}

class _BodyhomeState extends State<Bodyhome> {
  Widget buildCategories() {
    final categories = [
      {'name': 'Additions &\nRemodels', 'icon': Icons.house_outlined},
      {'name': 'Roofing &\nGutters', 'icon': Icons.roofing},
      {'name': 'Painting', 'icon': Icons.format_paint_outlined},
      {'name': 'Cleaning', 'icon': Icons.cleaning_services_outlined},
      {'name': 'Plumbing', 'icon': Icons.plumbing},
      {'name': 'Electrical', 'icon': Icons.electrical_services},
    ];

    return SizedBox(
      height: 135,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];

          return SizedBox(
            width: 100,
            child: GestureDetector(
              onTap: () {
                debugPrint('Selected: ${category['name']}');
              },
              child: Column(
                children: [
                  Container(
                    height: 68,
                    width: 68,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF0ED),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      category['icon'] as IconData,
                      color: const Color(0xFFFF6054),
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    category['name'] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildPopularProjects() {
    final projects = [
      {
        'title': 'Handyman Services',
        'description': 'Repairs, installations and more',
        'image': 'assets/professional.png',
      },
      {
        'title': 'Lawn Mowing',
        'description': 'Keep your yard looking great',
        'image': 'assets/lawn.png',
      },
      {
        'title': 'AC Installation and Service',
        'description': 'Stay cool with our AC services',
        'image': 'assets/ac.png',
      },
      {
        'title': 'plumbing Services',
        'description': 'Fix leaks, clogs, and more',
        'image': 'assets/plumbing.png',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Popular Projects',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'See All',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF075F62),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];

              return Container(
                width: 230,
                margin: EdgeInsets.only(
                  left: index == 0 ? 20 : 8,
                  right: 8,
                  bottom: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Project image
                      SizedBox(
                        height: 155,
                        width: double.infinity,
                        child: Image.asset(
                          project['image']!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: const Color(0xFFE5F7EE),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.image_not_supported_outlined,
                                size: 40,
                                color: Color(0xFF075F62),
                              ),
                            );
                          },
                        ),
                      ),

                      // Project details
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project['title']!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              project['description']!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Promotional carousel
          const HomeCarousel(),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF075F62),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          buildCategories(),

          const SizedBox(height: 30),

          // Project cards with images
          buildPopularProjects(),
        ],
      ),
    );
  }
}
