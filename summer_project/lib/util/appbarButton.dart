import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class CustomAppbarButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomAppbarButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CustomAppbarButtonState createState() => _CustomAppbarButtonState();
}

class _CustomAppbarButtonState extends State<CustomAppbarButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: InkResponse(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: _isHovering
                ? const LinearGradient(
                    colors: [
                      Colors.green,
                      Color.fromARGB(255, 8, 66, 131),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  )
                : null,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            widget.text,
            style: TextStyle(
              color: _isHovering ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
