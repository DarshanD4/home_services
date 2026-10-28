import 'bodyscreen.dart';

import 'package:flutter/material.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Teal background
          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: Color(0xFF075F62),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
            ),
          ),

          // Decorative background shape
          Positioned(
            top: 0,
            left: 150,
            child: Container(
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF005356),
                borderRadius: BorderRadius.circular(60),
              ),
            ),
          ),

          // Current location — top right
          Positioned(
            top: 25,
            right: 20,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                debugPrint('Location tapped');
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                  SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your location',
                        style: TextStyle(color: Colors.white70, fontSize: 11),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Coimbatore',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 3),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Search bar
          Positioned(
            left: 20,
            right: 20,
            top: 75,
            child: Container(
              height: 62,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, size: 30, color: Colors.black87),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Try plumbing, handyman, roofing...',
                        border: InputBorder.none,
                        isDense: true,
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    const Bodyhome(),
    const Center(child: Text('Your Projects')),
    const Center(child: Text('Find Professionals')),
    const Center(child: Text('Your Inbox')),
    const Center(child: Text('More Options')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        top: false,
        child: selectedIndex == 0
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    const HomeTopBar(),
                    const SizedBox(height: 45),
                    const Bodyhome(),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            : screens[selectedIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFFF6054),
        unselectedItemColor: Colors.black87,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: 'Projects',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Inbox',
          ),
        ],
      ),
    );
  }
}
