import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_market/blocs/market_bloc/market_bloc.dart';
import 'package:stocks_market/blocs/profile_bloc/profile_bloc.dart';
import 'package:stocks_market/utils/services/database_service.dart';

import 'bookmarks_screen.dart';
import 'home_screen.dart';
import 'search_screen.dart';

class PrimaryScreen extends StatefulWidget {
  const PrimaryScreen({Key? key}) : super(key: key);

  @override
  State<PrimaryScreen> createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<PrimaryScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [];
  late final PageController pageController;
  final Map<String, String> pagesHeaders = {
    'U.S Markets': 'Sector Performance',
    'Search': 'Search Companies',
    'News': 'Latest News',
    'Settings': '',
  };

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    _pages.addAll([
      BlocProvider(
        create: (context) => MarketBloc(),
        child: HomeScreen(),
      ),
      SearchScreen(),
      Container(),
      Container(),
    ]);
    super.initState(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 2,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              pagesHeaders.keys.elementAt(_currentIndex),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              pagesHeaders.values.elementAt(_currentIndex),
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
          ],
        ),
        centerTitle: false,
        actions: _currentIndex == 0
            ? [
                IconButton(
                  onPressed: () async {
                    final symbolBox = await DatabaseService.getSymbolsBox();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => BookmarksScreen(
                              symbolsBox: symbolBox,
                            )));
                  },
                  icon: Icon(Icons.bookmarks),
                  color: Colors.black,
                ),
              ]
            : null,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.newspaper, title: 'News'),
          TabItem(icon: Icons.settings, title: 'Settings'),
          // TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 0, //optional, default as 0
        onTap: (int i) => setState(() => _currentIndex = i),
      ),
    );
  }
}
