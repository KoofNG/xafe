import 'package:flutter/material.dart';

/// [XafeAnimatedIndexedStack]
class XafeAnimatedIndexedStack extends StatefulWidget {
  /// index of the screen
  final int index;

  /// children to show
  final List<Widget> children;

  /// Constructor
  XafeAnimatedIndexedStack({
    Key key,
    this.index,
    this.children,
  }) : super(key: key);

  @override
  _XafeAnimatedIndexedStackState createState() =>
      _XafeAnimatedIndexedStackState();
}

class _XafeAnimatedIndexedStackState extends State<XafeAnimatedIndexedStack>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  int _index;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceIn,
      ),
    );

    _index = widget.index;
    _controller.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(XafeAnimatedIndexedStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.index != _index) {
      _controller.reverse().then((_) {
        setState(() => _index = widget.index);
        _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _controller.value,
          child: Transform.scale(
            scale: 1.015 - (_controller.value * 0.014),
            child: child,
          ),
        );
      },
      child: IndexedStack(
        index: _index,
        children: widget.children,
      ),
    );
  }
}
