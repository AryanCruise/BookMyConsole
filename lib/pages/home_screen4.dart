import 'package:book_my_console/models/cafe_data.dart';
import 'package:book_my_console/pages/cafe_booking.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

Map<String, IconData> techIcons = {
  'PS5': Icons.sports_esports,
  'PS4': Icons.sports_esports,
  'PC': Icons.computer,
  'Xbox': Icons.videogame_asset,
  'Nintendo': Icons.gamepad,
};

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<CafeData> cafesCyber = [];

  void _getInfo() {
    cafesCyber = CafeData.getCafes();
  }

  @override
  Widget build(BuildContext context) {
    _getInfo();
    return Scaffold(
      appBar: buildAppBar(context),
      endDrawer: buildEndDrawer(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D0D0D), // Dark color at the top
              Color(0xFF0137A9), // Slightly lighter at the bottom
            ],
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              buildSearchAndFilterRow(),
              const SizedBox(height: 5),
              Divider(color: Colors.grey, thickness: 2, height: 1),
              const SizedBox(height: 15),
              Expanded(child: _buildGamingCafesList()),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGamingCafesList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cafesCyber.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap:
              () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingPage(
                  cafeData: cafesCyber[index],
                ),
              ),
            ),
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(

              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFF1b1e26),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        cafesCyber[index].imagePath,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 7),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cafesCyber[index].name,
                                softWrap: true,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_border,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    cafesCyber[index].rating.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.grey,
                                size: 16,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                cafesCyber[index].sectorCity,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children:
                                cafesCyber[index].options
                                    .map(
                                      (tech) => Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8.0,
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            border: Border.all(
                                              color: Colors.white70,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                techIcons[tech],
                                                color: Colors.white70,
                                                size: 12,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                tech,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ' ₹${cafesCyber[index].price}/hr',
                                style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontSize: 17,
                                ),
                              ),
                              ElevatedButton(
                                onPressed:
                                    () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BookingPage(
                                            cafeData: cafesCyber[index],
                                          ),
                                        ),
                                      ),
                                    },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Text(
                                  'Book Now',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }

  Drawer buildEndDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF1b1e26),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF184298)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.person, size: 40, color: Colors.black),
                ),
                SizedBox(height: 10),
                Text(
                  'Aryan Nair',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            title: const Text('Profile', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.white),
            title: const Text(
              'Notifications',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Sign Out', style: TextStyle(color: Colors.red)),
            onTap: () {
              logout(context);
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }

  Widget buildSearchAndFilterRow() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Color(0xFF1b1e26),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Search gaming cafes...',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Color(0xFF1b1e26),
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.tune, color: Colors.amber),
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Row(
        children: [
          const Icon(Icons.videogame_asset, color: Colors.amber, size: 18),
          const SizedBox(width: 6),
          const Text.rich(
            TextSpan(
              text: 'Book',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: [
                TextSpan(text: 'My', style: TextStyle(color: Colors.amber)),
                TextSpan(
                  text: 'Console',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            backgroundColor: Color(0xFF184298),
            child: Icon(Icons.light_mode, color: Colors.white),
          ),
        ),
        Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: CircleAvatar(
                backgroundColor: Color(0xFF184298),
                child: Icon(Icons.person, color: Colors.amberAccent),
              ),
            );
          },
        ),
      ],
    );
  }

  Future<void> logout(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();

      // Disconnect and sign out from Google
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.disconnect();
        await googleSignIn.signOut();
      }

      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successfully signed out'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
      // Navigate back to login screen after short delay
      await Future.delayed(const Duration(milliseconds: 1000));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error signing out: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
