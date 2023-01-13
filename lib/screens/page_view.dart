import 'package:flutter/material.dart';
import 'package:prov/screens/dbscreen/infopage.dart';
import 'package:prov/screens/mainscreen/homepage.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: const [
        HomePage(),
        InfoPage(),
      ],
    );
  }
}
