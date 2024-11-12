import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodhub/presentation/screens/home/sign_up/sign_up.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/backgroundimage.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(90, 73, 77, 99),
                        Color(0xff191B2F),
                      ],
                      begin: Alignment(0.0, 0.0),
                      end: Alignment(0.0, 0.80),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: constraints.maxWidth > 600
                          ? constraints.maxWidth * 0.5 + 142
                          : constraints.maxWidth * 0.5 + 142,
                      top: 26),
                  child: Container(
                    height: 35,
                    width: 63,
                    child: ElevatedButton(
                      onPressed: () {
                        Flexify.go(
                          SignUpPage(),
                          animation: FlexifyRouteAnimations.zoom,
                          animationDuration: Duration(milliseconds: 500),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            'Skip',
                            maxLines: 1,
                            style: TextStyle(
                                color: Color(0xffFE724C),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Sofia Pro'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: constraints.maxHeight * 0.2, left: 28),
                      child: Text(
                        'Welcome to',
                        style: TextStyle(
                          color: Color(0xff111719),
                          fontSize: constraints.maxWidth > 600 ? 65 : 65,
                          fontFamily: 'Sofia Pro',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28),
                      child: Transform.translate(
                        offset: Offset(0, -10),
                        child: Text(
                          'FoodHub',
                          style: TextStyle(
                            color: Color(0xffFE724C),
                            fontWeight: FontWeight.w700,
                            fontSize: constraints.maxWidth > 600 ? 55 : 55,
                            fontFamily: 'Sofia Pro',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 28),
                      child: Text(
                        'Your favourite foods delivered \nfast at your door.',
                        style: TextStyle(
                          color: Color(0xff30384F),
                          fontSize: 18,
                          fontFamily: 'Sofia Pro',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: constraints.maxHeight * 0.73,
                    left: constraints.maxWidth * 0.1,
                  ),
                  child: Container(
                    width: constraints.maxWidth * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 0.7,
                          color: Color.fromARGB(227, 255, 255, 255),
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 30,
                          ),
                          child: Text(
                            'sign in with',
                            style: TextStyle(
                                fontFamily: 'Sofia Pro',
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 0.7,
                          color: Color.fromARGB(227, 255, 255, 255),
                        )),
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: constraints.maxWidth * 0.068,
                        top: constraints.maxHeight * 0.77,
                      ),
                      child: Container(
                        height: 54,
                        width: constraints.maxWidth * 0.33,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: SvgPicture.asset('assets/logo2.svg'),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 6, top: 5),
                                  child: Text(
                                    'FACEBOOK',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Sofia Pro',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: constraints.maxWidth * 0.210,
                        top: constraints.maxHeight * 0.77,
                      ),
                      child: Container(
                        height: 54,
                        width: constraints.maxWidth * 0.33,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 2),
                                  child: SvgPicture.asset('assets/logo.svg'),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 6, top: 5),
                                  child: Text(
                                    'GOOGLE',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Sofia Pro',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: constraints.maxHeight * 0.85,
                    left: constraints.maxWidth * 0.07,
                  ),
                  child: Container(
                    width: constraints.maxWidth * 0.87,
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        side: BorderSide(color: Colors.white),
                        backgroundColor: Color(0xff36ffffff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Center(
                        child: Text(
                          'Start with email or phone',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Sofia Pro',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: constraints.maxHeight * 0.96,
                    left: constraints.maxWidth * 0.250,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Sofia Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Sofia Pro',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
