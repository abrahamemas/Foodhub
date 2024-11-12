import 'package:flutter/material.dart';

class SelectBotton extends StatefulWidget {
  final bool isActive;
  final Function(bool) onTap;

  SelectBotton({
    this.isActive = false,
    required this.onTap,
  });

  @override
  _SelectButtonState createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectBotton> {
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _isActive = widget.isActive;
  }

  void _toggleSwitch() {
    setState(() {
      _isActive = !_isActive;
      widget.onTap(_isActive);
    });
  }

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              border: Border.all(
                color: _isActive ? Color(0xffFE724C) : Color(0xffD4D5DA),
                width: 2,
              ),
            ),
            child: Center(
              child: _isActive
                  ? Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(0xffFE724C),
                        borderRadius: BorderRadius.circular(35),
                      ),
                    )
                  : Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
