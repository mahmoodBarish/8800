import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class Message01Screen extends StatefulWidget {
  const Message01Screen({Key? key}) : super(key: key);

  @override
  State<Message01Screen> createState() => _Message01ScreenState();
}

class _Message01ScreenState extends State<Message01Screen> {
  int _selectedTabIndex = 0; // 0 for message, 1 for notification
  int _selectedBottomNavIndex = 3; // 3 for message, assuming 0-indexed

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Status Bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.015,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '9:41',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF1F1F39),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.signal_cellular_alt,
                          color: Color(0xFF1F1F39), size: 20),
                      SizedBox(width: screenWidth * 0.01),
                      const Icon(Icons.wifi, color: Color(0xFF1F1F39), size: 20),
                      SizedBox(width: screenWidth * 0.01),
                      const Icon(Icons.battery_full,
                          color: Color(0xFF1F1F39), size: 20),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            // Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Notifications',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF1F1F39),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            // Tabs
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTabIndex = 0;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'message',
                              style: GoogleFonts.poppins(
                                color: _selectedTabIndex == 0
                                    ? const Color(0xFF1F1F39)
                                    : const Color(0xFF1F1F39),
                                fontSize: 16,
                                fontWeight: _selectedTabIndex == 0
                                    ? FontWeight.w500
                                    : FontWeight.normal,
                              ),
                            ),
                            if (_selectedTabIndex == 0) ...[
                              SizedBox(width: screenWidth * 0.01),
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Colors.transparent, // Adjusted based on comment
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ]
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        _selectedTabIndex == 0
                            ? Container(
                                width: screenWidth * 0.12, // Approx 42px for 375 width
                                height: 2,
                                color: const Color(0xFF3D5BFF),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.12),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTabIndex = 1;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'notification',
                              style: GoogleFonts.poppins(
                                color: _selectedTabIndex == 1
                                    ? const Color(0xFF1F1F39)
                                    : const Color(0xFF1F1F39),
                                fontSize: 16,
                                fontWeight: _selectedTabIndex == 1
                                    ? FontWeight.w500
                                    : FontWeight.normal,
                              ),
                            ),
                            if (_selectedTabIndex == 1) ...[
                              SizedBox(width: screenWidth * 0.01),
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFF6905),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ]
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        _selectedTabIndex == 1
                            ? Container(
                                width: screenWidth * 0.12, // Placeholder width
                                height: 2,
                                color: const Color(0xFF3D5BFF),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            // Message Cards List
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                children: [
                  _buildMessageCard(
                    context,
                    avatarColor: const Color(0xFFD8FFEF), // I194_271
                    senderName: 'Bert Pullman',
                    status: 'Online',
                    time: '04:32 pm',
                    message:
                        'Congratulations on completing the first lesson, \nkeep up the good work!',
                    hasImage: false,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildMessageCard(
                    context,
                    avatarColor: const Color(0xFFD8FFEF), // I194_283
                    senderName: 'Daniel Lawson',
                    status: 'Online',
                    time: '04:32 pm',
                    message:
                        'Your course has been updated, you can check \nthe new course in your study course.',
                    hasImage: true,
                    imageColor: const Color(0xFFFFE7EE), // I194_290
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildMessageCard(
                    context,
                    avatarColor: const Color(0xFFD8FFEF), // I194_298
                    senderName: 'Nguyen Shane',
                    status: 'Offline',
                    time: '12:00 am',
                    message:
                        'Congratulations, you have completed your \nregistration! Let\'s start your learning journey next.',
                    hasImage: true,
                    imageColor: const Color(0xFFFFE7EE), // I194_305
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
            // Bottom Navigation Bar
            Container(
              padding: EdgeInsets.only(
                top: screenHeight * 0.015,
                bottom: MediaQuery.of(context).padding.bottom +
                    screenHeight * 0.015,
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomNavItem(
                      context, Icons.home_outlined, 'Home', 0, '/home'),
                  _buildBottomNavItem(
                      context, Icons.book_outlined, 'Course', 1, '/course'),
                  _buildBottomNavItem(
                      context, Icons.search, 'Search', 2, '/search'),
                  _buildBottomNavItem(
                      context, Icons.message, 'Message', 3, '/message'),
                  _buildBottomNavItem(
                      context, Icons.person_outline, 'Account', 4, '/account'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageCard(
    BuildContext context, {
    required Color avatarColor,
    required String senderName,
    required String status,
    required String time,
    required String message,
    bool hasImage = false,
    Color? imageColor,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB8B8D2).withOpacity(0.2),
            offset: const Offset(0, 8),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: screenWidth * 0.12, // 48px for 375px width
                height: screenWidth * 0.12,
                decoration: BoxDecoration(
                  color: avatarColor,
                  shape: BoxShape.circle,
                ),
                // No image asset provided, so just a colored circle.
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      senderName,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF1F1F39),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      status,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF858597),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                time,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF858597),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.02),
          Text(
            message,
            style: GoogleFonts.poppins(
              color: const Color(0xFF858597),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          if (hasImage && imageColor != null) ...[
            SizedBox(height: screenWidth * 0.04),
            Container(
              width: double.infinity,
              height: screenWidth * 0.38, // 145px for 375px width
              decoration: BoxDecoration(
                color: imageColor,
                borderRadius: BorderRadius.circular(8),
              ),
              // No image asset provided, so just a colored rectangle.
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(
      BuildContext context, IconData icon, String label, int index, String routeName) {
    final isSelected = _selectedBottomNavIndex == index;
    final color = isSelected ? const Color(0xFF3D5BFF) : const Color(0xFFB8B8D2);

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedBottomNavIndex = index;
        });
        context.go(routeName); // Navigate using go_router
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}