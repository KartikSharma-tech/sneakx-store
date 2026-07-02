import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/wishlist/wishlist_screen.dart';
import '../core/constants/app_colors.dart';
import '../screens/home/home_screen.dart';
import '../screens/profile/profile_screen.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int currentIndex = 0;

  final List<Widget> screens = [
  const HomeScreen(),
  const WishlistScreen(),
  const CartScreen(),
  // const Center(child: Text("Orders")),
  const CartScreen(),
  // const Center(child: Text("Profile")),
  const ProfileScreen(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        backgroundColor: AppColors.cardColor,

        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,

        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Iconsax.heart),
            label: "Wishlist",
          ),

          BottomNavigationBarItem(
            icon: Icon(Iconsax.shopping_cart),
            label: "Cart",
          ),

          BottomNavigationBarItem(
            icon: Icon(Iconsax.box),
            label: "Orders",
          ),

          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}