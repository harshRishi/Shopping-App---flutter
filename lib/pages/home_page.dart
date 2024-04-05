import 'package:flutter/material.dart';
import 'package:shop_app_flutter/pages/cart_page.dart';
import 'package:shop_app_flutter/widgets/products_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = const [ProductsList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack maintain the scroll when page is change and also page the page as index chnages
      // Mean while we can also use body: pages[currentPage] but this won't maintain the scroll here
      body: IndexedStack(index: currentPage, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        ],
      ),
    );
  }
}
