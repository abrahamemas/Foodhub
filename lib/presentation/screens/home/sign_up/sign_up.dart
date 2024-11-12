import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodhub/presentation/screens/home/login/login.dart';
import 'package:foodhub/presentation/screens/home/splash_screen/loading_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  String _email = '';
  String _password = '';
  void _handleSignUp() async {
    setState(() {
      isLoading = true;
    });

    try {
      if (_password.length < 8) {
        throw Exception("Password should be at least 8 characters");
      }

      if (!_email.contains('@')) {
        throw Exception("Invalid email format");
      }

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoadingScreen()),
      );

      print("User Signed Up:${userCredential.user!.email}");
    } catch (e) {
      print("Error During Signing Up: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBFBFB),
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: SvgPicture.asset('assets/circles.svg'),
                    ).animate().slide(
                        begin: Offset(1, 0),
                        end: Offset(0, 0),
                        duration: 1000.ms),
                    SvgPicture.asset('assets/circle2.svg').animate().slide(
                        begin: Offset(1, 0),
                        end: Offset(0, 0),
                        duration: 1000.ms),
                    Padding(
                      padding: EdgeInsets.only(
                        left: constraints.maxWidth * 0.840,
                      ),
                      child: SvgPicture.asset('assets/circle3.svg')
                          .animate()
                          .slide(
                              begin: Offset(1, 0),
                              end: Offset(0, 0),
                              duration: 1000.ms),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: constraints.maxHeight * 0.098,
                            left: constraints.maxWidth * 0.046,
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 36.41,
                              fontFamily: 'Sofia Pro',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: constraints.maxHeight * 0.031,
                            left: constraints.maxWidth * 0.050,
                          ),
                          child: Text(
                            'Full name',
                            style: TextStyle(
                              color: Color(0xff9796A1),
                              fontSize: 18,
                              fontFamily: 'Sofia Pro',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: constraints.maxHeight * 0.012,
                              left: constraints.maxWidth * 0.050),
                          child: Container(
                            width: constraints.maxWidth * 0.880,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your Name';
                                }
                                return null;
                              },
                              controller: nameController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffFE724C),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffEEEEEE),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 22, horizontal: 17),
                                hintText: 'Arlene Mccoy',
                                hintStyle: TextStyle(
                                  color: Color(0xff111719),
                                  fontSize: 19,
                                  fontFamily: 'Sofia Pro',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: constraints.maxHeight * 0.029,
                            left: constraints.maxWidth * 0.050,
                          ),
                          child: Text(
                            'E-mail',
                            style: TextStyle(
                              color: Color(0xff9796A1),
                              fontSize: 18,
                              fontFamily: 'Sofia Pro',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: constraints.maxHeight * 0.012,
                              left: constraints.maxWidth * 0.050),
                          child: Container(
                            width: constraints.maxWidth * 0.880,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your Email';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _email = value;
                                });
                              },
                              controller: emailController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffFE724C),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffEEEEEE),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 22, horizontal: 17),
                                hintText: 'prelookstudio@gmail.com',
                                hintStyle: TextStyle(
                                  color: Color(0xff111719),
                                  fontSize: 19,
                                  fontFamily: 'Sofia Pro',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: constraints.maxHeight * 0.029,
                            left: constraints.maxWidth * 0.050,
                          ),
                          child: Text(
                            'Password',
                            style: TextStyle(
                              color: Color(0xff9796A1),
                              fontSize: 18,
                              fontFamily: 'Sofia Pro',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: constraints.maxHeight * 0.012,
                              left: constraints.maxWidth * 0.050),
                          child: Container(
                            width: constraints.maxWidth * 0.880,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your Password';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _password = value;
                                });
                              },
                              obscureText: obscureText,
                              controller: passwordController,
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  child: obscureText
                                      ? Icon(Icons.visibility_rounded,
                                          color: Color(0xffD0D2D1))
                                      : Icon(Icons.visibility_outlined,
                                          color: Color(0xffD0D2D1)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffFE724C),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffEEEEEE),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 22, horizontal: 17),
                                hintText: 'Create Your Password',
                                hintStyle: TextStyle(
                                  color: Color(0xff111719),
                                  fontSize: 19,
                                  fontFamily: 'Sofia Pro',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: constraints.maxWidth * 0.068,
                            left: constraints.maxWidth * 0.150,
                          ),
                          child: Container(
                            width: constraints.maxWidth * 0.700,
                            height: constraints.maxWidth * 0.15,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                backgroundColor: Color(0xffFE724C),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _handleSignUp();
                                }
                              },
                              child: Center(
                                child: Stack(
                                  children: [
                                    if (!isLoading)
                                      Text(
                                        'SIGN UP',
                                        style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontSize: 18,
                                          fontFamily: 'Sofia Pro',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    if (isLoading)
                                      Container(
                                          child: Center(
                                        child: SpinKitCircle(
                                          color: Colors.white,
                                        ),
                                      ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: constraints.maxWidth * 0.078,
                            left: constraints.maxWidth * 0.250,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                    );
                                  },
                                  child: Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                      color: Color(0xff5B5B5E),
                                      fontSize: 16,
                                      fontFamily: 'Sofia Pro',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                    );
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Color(0xffFE724C),
                                      fontSize: 16,
                                      fontFamily: 'Sofia Pro',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: constraints.maxHeight * 0.0500,
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
                                  color: Color(0xffB3B3B3),
                                )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 30,
                                  ),
                                  child: Text(
                                    'Sign up with',
                                    style: TextStyle(
                                        fontFamily: 'Sofia Pro',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff5B5B5E)),
                                  ),
                                ),
                                Expanded(
                                    child: Divider(
                                  thickness: 0.7,
                                  color: Color(0xffB3B3B3),
                                )),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: constraints.maxHeight * 0.024,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: constraints.maxWidth * 0.088,
                                ),
                                child: Container(
                                  height: 54,
                                  width: constraints.maxWidth * 0.33,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      offset: Offset(4.0, 4.0),
                                      blurRadius: 15.0,
                                      spreadRadius: 1.0,
                                    ),
                                    BoxShadow(
                                      color: Color(0xffFFFFFFF),
                                      offset: Offset(-4.0, -4.0),
                                      blurRadius: 15.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ]),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xffFFFFFF),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 5),
                                            child: SvgPicture.asset(
                                                'assets/logo3.svg'),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 6, top: 5),
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
                                  left: constraints.maxWidth * 0.145,
                                ),
                                child: Container(
                                  height: 54,
                                  width: constraints.maxWidth * 0.33,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      offset: Offset(4.0, 4.0),
                                      blurRadius: 15.0,
                                      spreadRadius: 1.0,
                                    ),
                                    BoxShadow(
                                      color: Color(0xffFFFFFFF),
                                      offset: Offset(-4.0, -4.0),
                                      blurRadius: 15.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ]),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xffFFFFFF),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(28),
                                      ),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: SvgPicture.asset(
                                                'assets/logo4.svg'),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 6, top: 5),
                                            child: Text(
                                              'GOOGLE',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Sofia Pro',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
