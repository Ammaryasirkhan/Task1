import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_1_to_do_list_app/Classes/dimensions.dart';

import '../Classes/colors.dart';
import '../Classes/home_page_items.dart';
import '../Widgets/big_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void naviagtetoTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: homeScreenItems,
        onPageChanged: onPageChanged,
        controller: pageController,
      ),
      bottomNavigationBar: CupertinoTabBar(onTap: naviagtetoTapped, items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_rounded,
            color: _page == 0 ? ColorRes.app : Colors.black,
          ),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.task_alt_rounded,
            color: _page == 1 ? ColorRes.app : Colors.black,
          ),
          label: 'My Tasks',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_2,
            color: _page == 2 ? ColorRes.app : Colors.black,
          ),
          label: 'My account',
        ),
      ]),
    );
  }
}
