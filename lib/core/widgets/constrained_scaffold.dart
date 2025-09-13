import 'package:flutter/material.dart';

class ConstrainedScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Color? backGroundColor;
  final bool? extendBodyBehindAppBar;
  const ConstrainedScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.drawer,
    this.backGroundColor,
    this.extendBodyBehindAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
      appBar: appBar,
      drawer: drawer,
      body: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 430),
        child: body,
      ),
    );
  }
}
