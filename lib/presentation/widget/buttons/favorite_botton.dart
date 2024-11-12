import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final bool isActive;
  final Function(bool) onTap;

  FavoriteButton({
    this.isActive = false,
    required this.onTap,
  });

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
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
            width: 53,
            height: 53,
            decoration: BoxDecoration(
              color: _isActive
                  ? Color(0xffFE724C)
                  : Color(0xFFFFFFFF).withOpacity(0.2),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: GestureDetector(
                child: Icon(
                  Icons.favorite_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
