import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
class XafeBaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  ///
  final Widget Function(BuildContext context, T model, Widget child) builder;

  ///
  final T model;

  ///
  final Widget child;

  ///
  final Function(T) onModelReady;

  ///
  XafeBaseWidget({
    Key key,
    this.builder,
    this.model,
    this.child,
    this.onModelReady,
  }) : super(key: key);

  _XafeBaseWidgetState<T> createState() => _XafeBaseWidgetState<T>();
}

class _XafeBaseWidgetState<T extends ChangeNotifier>
    extends State<XafeBaseWidget<T>> {
  T model;

  @override
  void initState() {
    model = widget.model;

    if (widget.onModelReady != null) widget.onModelReady(model);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
