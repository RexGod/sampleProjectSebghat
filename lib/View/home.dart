import 'package:flutter/material.dart';
import 'package:sample/View/inquiry.dart';
import 'package:sample/View/widgets/Drawer.dart';
import 'package:sample/View/widgets/gridViewItems.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 28, 53),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 53, 28, 53),
        elevation: 0,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image.asset(
              'assets/logo.png',
              width: 100.0,
              height: 100.0,
            ),
          ),
        ),
      ),
      drawer: DrawerItems(
        id: id,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          const Center(
            child: Text(
              'استعلام قیمت، خرید و فروش قطعات یدکی',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Inquiry.routeName, arguments: id);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFF57C00),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'استعلام قطعه و خرید',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8.0),
                Icon(Icons.shopping_cart, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return homeItems(index: index);
              },
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: false,
    );
  }
}
