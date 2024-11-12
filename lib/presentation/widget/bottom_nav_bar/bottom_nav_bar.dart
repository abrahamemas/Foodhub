import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PersistentBottomNavBar extends StatefulWidget {
  const PersistentBottomNavBar({Key? key}) : super(key: key);

  @override
  State<PersistentBottomNavBar> createState() => _PersistentBottomNavBarState();
}

class _PersistentBottomNavBarState extends State<PersistentBottomNavBar> {
  int _selectedIndex = 0;
  final Color _selectedColor = Color(0xffFE724C);
  final Color _defaultColor = Color(0xffD3D1D8);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        GoRouter.of(context).go('/home_screen');
        break;
      case 1:
        GoRouter.of(context).go('/cart');
        break;
      case 2:
        GoRouter.of(context).go('/category1');
        break;
      case 3:
        GoRouter.of(context).go('/favorites');
        break;
      case 4:
        GoRouter.of(context).go('/orders');
        break;
    }
  }

  Color _iconColor(int index) {
    return _selectedIndex == index ? _selectedColor : _defaultColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: NavigationBar(
        elevation: 0,
        indicatorColor: Colors.transparent,
        backgroundColor: Color(0xffFBFBFB),
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/Path.svg',
              height: 42,
              width: 42,
              color: _iconColor(0),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/Map.svg',
              height: 42,
              width: 42,
              color: _iconColor(1),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/Shop.svg',
              height: 42,
              width: 42,
              color: _iconColor(2),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SvgPicture.asset(
                'assets/Like.svg',
                height: 42,
                width: 42,
                color: _iconColor(3),
              ),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/Bell.svg',
              height: 42,
              width: 42,
              color: _iconColor(4),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
