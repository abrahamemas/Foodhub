import 'dart:io';
import 'package:animated_glitch/animated_glitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:foodhub/presentation/screens/home/category1/asian_category.dart';
import 'package:foodhub/presentation/screens/home/category1/burger_category.dart';
import 'package:foodhub/presentation/screens/home/category1/donuts_category.dart';
import 'package:foodhub/presentation/screens/home/category1/mexican_category.dart';
import 'package:foodhub/presentation/screens/home/category1/pizza_category.dart';
import 'package:foodhub/presentation/screens/home/welcome_screen/welcome_screen.dart';
import 'package:foodhub/presentation/widget/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:foodhub/presentation/widget/buttons/ios_bottons.dart';
import 'package:foodhub/presentation/widget/cards/cards.dart';
import 'package:foodhub/presentation/widget/cards/small_card.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  final advancedDrawerController = AdvancedDrawerController();

  void drawerControl() {
    advancedDrawerController.showDrawer();
  }

  final _controller = AnimatedGlitchController(
    frequency: const Duration(milliseconds: 200),
    level: 1.2,
    distortionShift: const DistortionShift(count: 3),
  );

  File? image;

  Future<void> pickImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage == null) {
        print('No image picked');
        return;
      }

      final imageTemporary = File(pickedImage.path);
      setState(() {
        image = imageTemporary;
      });
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return AdvancedDrawer(
          backdropColor: Color(0xffF5F5F5),
          openRatio: 0.57,
          controller: advancedDrawerController,
          rtlOpening: false,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 400),
          childDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          drawer: SafeArea(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: constraints.maxWidth * 0.026,
                    ),
                    child: GestureDetector(
                      onTap: pickImage,
                      child: Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: AnimatedGlitch(
                          controller: _controller,
                          child: ClipOval(
                            child: image != null
                                ? Image.file(
                                    image!,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'assets/image1.png',
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ).animate().slide(
                      begin: Offset(1, 0),
                      end: Offset(0, 0),
                      duration: 1000.ms),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(
                      left: constraints.maxWidth * 0.026,
                    ),
                    child: Text(
                      'Farion Wick',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ).animate().slide(
                      begin: Offset(1, 0),
                      end: Offset(0, 0),
                      duration: 1000.ms),
                  Padding(
                    padding: EdgeInsets.only(
                      top: constraints.maxWidth * 0.010,
                      left: constraints.maxWidth * 0.026,
                    ),
                    child: Text(
                      'farionwick@gmail.com',
                      style: TextStyle(
                        color: Color(0xff9EA1B1),
                        fontSize: 16,
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ).animate().slide(
                      begin: Offset(1, 0),
                      end: Offset(0, 0),
                      duration: 1000.ms),
                  SizedBox(height: 40),
                  ListTile(
                    onTap: () {},
                    leading: SvgPicture.asset('assets/Document.svg'),
                    title: Text(
                      'My Orders',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ).animate().slide(
                      begin: Offset(1, 0),
                      end: Offset(0, 0),
                      duration: 1000.ms),
                  ListTile(
                    onTap: () {},
                    leading: SvgPicture.asset('assets/Profile.svg'),
                    title: Text(
                      'My Profile',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ).animate().slide(
                      begin: Offset(1, 0),
                      end: Offset(0, 0),
                      duration: 1000.ms),
                  ListTile(
                    onTap: () {},
                    leading: SvgPicture.asset('assets/Location.svg'),
                    title: Text(
                      'Delivery Address',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ).animate().slide(
                      begin: Offset(1, 0),
                      end: Offset(0, 0),
                      duration: 1000.ms),
                  ListTile(
                    onTap: () {},
                    leading: SvgPicture.asset('assets/Wallet.svg'),
                    title: Text(
                      'Payment Methods',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ).animate().slide(
                      begin: Offset(1, 0),
                      end: Offset(0, 0),
                      duration: 1000.ms),
                  ListTile(
                    onTap: () {},
                    leading: SvgPicture.asset('assets/Message.svg'),
                    title: Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ).animate().slide(
                      begin: Offset(1, 0),
                      end: Offset(0, 0),
                      duration: 1000.ms),
                  ListTile(
                    onTap: () {},
                    leading: SvgPicture.asset('assets/Setting.svg'),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ).animate().slide(
                      begin: Offset(1, 0),
                      end: Offset(0, 0),
                      duration: 1000.ms),
                  ListTile(
                    onTap: () {},
                    leading: SvgPicture.asset('assets/Helps.svg'),
                    title: Text(
                      'Helps & FAQs',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ).animate().slide(
                      begin: Offset(1, 0),
                      end: Offset(0, 0),
                      duration: 1000.ms),
                  Spacer(),
                  ListTile(
                    onTap: () {},
                    leading: Container(
                      height: 43,
                      width: constraints.maxWidth * 0.2600,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomeScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffFE724C),
                            shadowColor: Color(0xffFFFFFF),
                            elevation: 5,
                            surfaceTintColor: Color(0xffFFFFFF),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/logout.svg',
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: constraints.maxWidth * 0.026,
                                ),
                                child: Text(
                                  'Log Out',
                                  style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 16,
                                    fontFamily: 'Sofia Pro',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ).animate().slide(
                                  begin: Offset(1, 0),
                                  end: Offset(0, 0),
                                  duration: 1000.ms),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          child: Scaffold(
            backgroundColor: Color(0xffFBFBFB),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: constraints.maxHeight * 0.038,
                          left: constraints.maxWidth * 0.038,
                        ),
                        child: Container(
                          height: 48,
                          width: constraints.maxWidth * 0.1000,
                          child: ElevatedButton(
                              onPressed: () {
                                drawerControl();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffFFFFFF),
                                shadowColor: Color(0xffFFFFFF),
                                elevation: 5,
                                surfaceTintColor: Color(0xffFFFFFF),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: SvgPicture.asset(
                                'assets/Menu.svg',
                              )),
                        ),
                      ).animate().fadeIn(duration: 1000.ms),
                      Padding(
                        padding: EdgeInsets.only(
                          top: constraints.maxHeight * 0.038,
                          left: constraints.maxWidth * 0.180,
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: constraints.maxWidth * 0.038,
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: constraints.maxWidth * 0.015,
                                        ),
                                        child: Text(
                                          'Deliver to',
                                          style: TextStyle(
                                            fontFamily: 'Sofia Pro',
                                            color: Color(0xff8C9099),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: constraints.maxWidth * 0.200,
                                        ),
                                        child: Transform.translate(
                                          offset: Offset(-18, -12),
                                          child: IconButton(
                                            iconSize: 14,
                                            color: Color(0xff989CA3),
                                            icon: Transform.rotate(
                                              angle: -3.14 / 2,
                                              child: Icon(Icons
                                                  .arrow_back_ios_new_rounded),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ).animate().fadeIn(duration: 1000.ms),
                            Transform.translate(
                              offset: Offset(-15, -20),
                              child: Text(
                                '4102  Pretty View Lane ',
                                style: TextStyle(
                                  fontFamily: 'Sofia Pro',
                                  color: Color(0xffFE724C),
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 1000.ms),
                      Padding(
                        padding: EdgeInsets.only(
                          top: constraints.maxHeight * 0.038,
                          left: constraints.maxWidth * 0.120,
                        ),
                        child: GestureDetector(
                          onTap: pickImage,
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: image != null
                                  ? Image.file(
                                      image!,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      'assets/image1.png',
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).animate().fadeIn(duration: 1000.ms),
                  Padding(
                    padding: EdgeInsets.only(
                      top: constraints.maxHeight * 0.018,
                      left: constraints.maxWidth * 0.040,
                    ),
                    child: Text(
                      'What would you like\nto order',
                      style: TextStyle(
                        fontFamily: 'Sofia Pro',
                        color: Color(0xff323643),
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ).animate().fadeIn(duration: 1000.ms),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: constraints.maxHeight * 0.012,
                            left: constraints.maxWidth * 0.040),
                        child: Container(
                          width: constraints.maxWidth * 0.720,
                          child: TextField(
                            textAlign: TextAlign.center,
                            onChanged: (value) {},
                            controller: _searchController,
                            decoration: InputDecoration(
                              fillColor: Color(0xffFCFCFD),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Color(0xffFE724C),
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Color(0xffEFEFEF),
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 17),
                              hintText: 'Find for food or restaurant...',
                              prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 23),
                                  child: SvgPicture.asset(
                                      'assets/search-icon.svg')),
                              prefixIconColor: Color(0xff767F9D),
                              hintStyle: TextStyle(
                                color: Color(0xff9AA0B4),
                                fontSize: 20,
                                fontFamily: 'Sofia Pro',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: constraints.maxHeight * 0.012,
                          left: constraints.maxWidth * 0.038,
                        ),
                        child: Container(
                          height: 60,
                          width: constraints.maxWidth * 0.1300,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffFFFFFF),
                                shadowColor: Color(0xffFFFFFF),
                                elevation: 2,
                                surfaceTintColor: Color(0xffFFFFFF),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: SvgPicture.asset(
                                'assets/cat.svg',
                              )),
                        ),
                      ),
                    ],
                  ).animate().fadeIn(duration: 1000.ms),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 30, left: constraints.maxWidth * 0.045),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        VerticalSwitchButton(
                          imagePath: 'assets/burger.png',
                          text: 'Burger',
                          onTap: (isActive) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BurgerCategoryScreen(
                                        recipeCount: 5,
                                      )),
                            );
                          },
                        ),
                        SizedBox(
                          width: 20.6,
                        ),
                        VerticalSwitchButton(
                          imagePath: 'assets/image2.png',
                          text: 'Donut',
                          onTap: (isActive) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DonutsCategoryScreen(
                                        recipeCount: 5,
                                      )),
                            );
                          },
                        ),
                        SizedBox(
                          width: 20.6,
                        ),
                        VerticalSwitchButton(
                          imagePath: 'assets/image3.png',
                          text: 'Pizza',
                          onTap: (isActive) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PizzaCategoryScreen(
                                        recipeCount: 5,
                                      )),
                            );
                          },
                        ),
                        SizedBox(
                          width: 20.6,
                        ),
                        VerticalSwitchButton(
                          imagePath: 'assets/image4.png',
                          text: 'Mexican',
                          onTap: (isActive) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MexicanCategoryScreen(
                                        recipeCount: 5,
                                      )),
                            );
                          },
                        ),
                        SizedBox(
                          width: 20.6,
                        ),
                        VerticalSwitchButton(
                          imagePath: 'assets/image5.png',
                          text: 'Asian',
                          onTap: (isActive) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AsianCategoryScreen(
                                        recipeCount: 5,
                                      )),
                            );
                          },
                        ),
                      ],
                    ),
                  ).animate().fadeIn(duration: 1000.ms),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: constraints.maxWidth * 0.045),
                          child: Text(
                            'Featured Restaurants',
                            style: TextStyle(
                              fontFamily: 'Sofia Pro',
                              color: Color(0xff323643),
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ).animate().fadeIn(duration: 1000.ms),
                        Padding(
                          padding: EdgeInsets.only(
                              right: constraints.maxWidth * 0.045),
                          child: Row(
                            children: [
                              Text(
                                'View All',
                                style: TextStyle(
                                  fontFamily: 'Sofia Pro',
                                  color: Color(0xffFE724C),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(2, -2),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xffFE724C),
                                  size: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(duration: 1000.ms),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15, left: constraints.maxWidth * 0.045),
                    child: Container(
                        child: BigCards(
                      recipeCount: 5,
                    )),
                  ).animate().fadeIn(duration: 1000.ms),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20, left: constraints.maxWidth * 0.045),
                        child: Text(
                          'Popular Items',
                          style: TextStyle(
                            fontFamily: 'Sofia Pro',
                            color: Color(0xff323643),
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ).animate().fadeIn(duration: 1000.ms),
                      Padding(
                        padding: EdgeInsets.only(top: 40, left: 15),
                        child: SmallCard(
                          recipeCount: 20,
                        ),
                      ).animate().fadeIn(duration: 1000.ms),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: PersistentBottomNavBar(),
          ),
        );
      },
    );
  }
}
