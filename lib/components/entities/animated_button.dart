import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget child;
  final bool turnOnOverlay;
  final double? borderRadius;
  const AnimatedButton(
      {super.key,
      required this.onTap,
      required this.child,
      this.turnOnOverlay = false,
      this.borderRadius});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool enabled = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _animation =
        Tween<double>(begin: 1.0, end: 0.92).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: widget.onTap != null
          ? (_) {
              _animationController.forward();
              widget.turnOnOverlay
                  ? setState(() {
                      enabled = true;
                    })
                  : null;
            }
          : null,
      onTapUp: widget.onTap != null
          ? (_) {
              _animationController.reverse();
              widget.turnOnOverlay
                  ? setState(() {
                      enabled = false;
                    })
                  : null;
            }
          : null,
      child: Container(
        decoration: BoxDecoration(
            color:
                (enabled ? Colors.grey.withOpacity(0.1) : Colors.transparent),
            borderRadius:
                enabled ? BorderRadius.circular(widget.borderRadius!) : null),
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (_, __) {
              return Transform.scale(
                scale: _animation.value,
                child: widget.child,
              );
            }),
      ),
    );
  }
}
