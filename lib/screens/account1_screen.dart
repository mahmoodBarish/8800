import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class Account1Screen extends StatefulWidget {
  const Account1Screen({Key? key}) : super(key: key);

  @override
  State<Account1Screen> createState() => _Account1ScreenState();
}

class _Account1ScreenState extends State<Account1Screen> {
  int _selectedIndex = 3; // Account is the 4th item (index 3)

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate based on index using go_router
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/course');
        break;
      case 2:
        context.go('/search');
        break;
      case 3:
      // Already on Account screen, no navigation needed
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Scaling factors based on a 375x812 reference screen
    final double horizontalScaleFactor = screenWidth / 375;
    final double verticalScaleFactor = screenHeight / 812;

    Color primaryTextColor = const Color(0xFF1F1F39);
    Color secondaryTextColor = const Color(0xFFB8B8D2);
    Color arrowColor = const Color(0xFF858597);
    Color primaryBlue = const Color(0xFF3D5CFF);
    Color avatarBgColor = const Color(0xFFEBEBFF);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100 * verticalScaleFactor),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20 * horizontalScaleFactor,
          ),
          child: Column(
            children: [
              SizedBox(height: 12 * verticalScaleFactor), // Status bar padding
              _buildStatusBar(horizontalScaleFactor),
              SizedBox(height: 17 * verticalScaleFactor),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Account',
                  style: GoogleFonts.poppins(
                    fontSize: 24 * horizontalScaleFactor,
                    fontWeight: FontWeight.w700,
                    color: primaryTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 * horizontalScaleFactor),
          child: Column(
            children: [
              SizedBox(height: 20 * verticalScaleFactor),
              // Avatar section
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 32 * horizontalScaleFactor, // 64 / 2
                      backgroundColor: avatarBgColor,
                      child: Icon(
                        Icons.person,
                        size: 40 * horizontalScaleFactor,
                        color: primaryTextColor,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 20 * horizontalScaleFactor,
                        height: 20 * verticalScaleFactor,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryBlue,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 12 * horizontalScaleFactor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20 * verticalScaleFactor),
              // List of cells
              _buildAccountListItem(
                'Favourite',
                () => context.go('/favorites'),
                primaryTextColor,
                arrowColor,
                horizontalScaleFactor,
                verticalScaleFactor,
              ),
              _buildAccountListItem(
                'Edit Account',
                () => context.go('/edit_account'),
                primaryTextColor,
                arrowColor,
                horizontalScaleFactor,
                verticalScaleFactor,
              ),
              _buildAccountListItem(
                'Settings and Privacy',
                () => context.go('/settings_privacy'),
                primaryTextColor,
                arrowColor,
                horizontalScaleFactor,
                verticalScaleFactor,
              ),
              _buildAccountListItem(
                'Help',
                () => context.go('/help'),
                primaryTextColor,
                arrowColor,
                horizontalScaleFactor,
                verticalScaleFactor,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(
        horizontalScaleFactor,
        verticalScaleFactor,
        primaryBlue,
        secondaryTextColor,
      ),
    );
  }

  Widget _buildStatusBar(double horizontalScaleFactor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '9:41',
          style: GoogleFonts.poppins(
            fontSize: 15 * horizontalScaleFactor,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1F1F39),
          ),
        ),
        Row(
          children: [
            Icon(Icons.signal_cellular_alt,
                size: 20 * horizontalScaleFactor, color: Colors.grey[700]),
            SizedBox(width: 4 * horizontalScaleFactor),
            Icon(Icons.wifi,
                size: 20 * horizontalScaleFactor, color: Colors.grey[700]),
            SizedBox(width: 4 * horizontalScaleFactor),
            Icon(Icons.battery_full,
                size: 20 * horizontalScaleFactor, color: Colors.grey[700]),
          ],
        ),
      ],
    );
  }

  Widget _buildAccountListItem(
    String title,
    VoidCallback onTap,
    Color textColor,
    Color arrowColor,
    double horizontalScaleFactor,
    double verticalScaleFactor,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 12 * verticalScaleFactor, horizontal: 0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFF3F3F5), // Light greyish separator
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16 * horizontalScaleFactor,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16 * horizontalScaleFactor,
              color: arrowColor,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(
    double horizontalScaleFactor,
    double verticalScaleFactor,
    Color activeColor,
    Color inactiveColor,
  ) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedItemColor: activeColor,
      unselectedItemColor: inactiveColor,
      selectedLabelStyle: GoogleFonts.poppins(
        fontSize: 11 * horizontalScaleFactor,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: 11 * horizontalScaleFactor,
        fontWeight: FontWeight.w500,
      ),
      onTap: _onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 24 * horizontalScaleFactor),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_outlined, // Representing 'Course'
              size: 24 * horizontalScaleFactor),
          label: 'Course',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 24 * horizontalScaleFactor),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 24 * horizontalScaleFactor),
          label: 'Account',
        ),
      ],
    );
  }
}