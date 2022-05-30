import 'package:booker/consts.dart';
import 'package:booker/view/explore_view/explore_view.dart';
import 'package:booker/view/search_view/search_view.dart';
import 'package:booker/view/wishlist_view/wishlist_view.dart';
import 'package:booker/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();

class _HomeViewState extends State<HomeView> {
  List<Widget> bodyList = [
    ExploreView(),
    SearchView(),
    WishlistView(),
  ];

  int selectedItem = 0;

  void changeIndex(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      endDrawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedItem,
          selectedItemColor: Colors.white,
          selectedLabelStyle:
              const TextStyle(color: Colors.white, fontSize: 16),
          unselectedItemColor: Colors.white.withOpacity(0.5),
          showUnselectedLabels: true,
          unselectedLabelStyle:
              TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16),
          backgroundColor: primaryColor,
          elevation: 0,
          onTap: (index) {
            changeIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                ),
                label: 'Wishlist'),
          ]),
      body: bodyList[selectedItem],
    );
  }
}
