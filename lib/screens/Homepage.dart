import 'package:ecommerce/screens/product_page.dart';
import 'package:flutter/cupertino.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _tabs = [
    const ProductsPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: 'Products',
                ),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.cart), label: 'Cart')
              ],
            ),
            tabBuilder: (BuildContext context, index) {
              return CupertinoTabView(
                routes: {
                  "/": (context) => HomePage(),
                  "product_page": (context) => ProductsPage(),
                  "cart_page": (context) => CartPage(),
                },
                builder: (BuildContext context) {
                  return _tabs[index];
                },
              );
            }),
      ),
    );
  }
}
