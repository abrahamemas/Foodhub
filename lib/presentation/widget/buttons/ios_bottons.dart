import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VerticalSwitchButton extends StatefulWidget {
  final String imagePath;
  final String text;
  final bool isActive;
  final Function(bool) onTap;

  VerticalSwitchButton({
    required this.imagePath,
    required this.text,
    this.isActive = false,
    required this.onTap,
  });

  @override
  _VerticalSwitchButtonState createState() => _VerticalSwitchButtonState();
}

class _VerticalSwitchButtonState extends State<VerticalSwitchButton> {
  late bool _isActive;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _isActive = widget.isActive;

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void _toggleSwitch() {
    setState(() {
      _isActive = !_isActive;
      widget.onTap(_isActive);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _toggleSwitch();
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: 70,
            height: 110,
            decoration: BoxDecoration(
              color: _isActive ? Color(0xffFE724C) : Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
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
              ],
            ),
            child: _isLoading
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            height: 59.56,
                            width: 59.56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Container(
                            height: 12,
                            width: 40,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          height: 59.56,
                          width: 59.56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Image.asset(
                            widget.imagePath,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          widget.text,
                          maxLines: 1,
                          style: TextStyle(
                            color: _isActive
                                ? Color(0xffFFFFFF)
                                : Color(0xff67666D),
                            fontSize: 12,
                            fontFamily: 'Sofia Pro',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
