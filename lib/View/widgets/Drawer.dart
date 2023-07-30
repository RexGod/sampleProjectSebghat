// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/ViewModel/userProvider.dart';

class DrawerItems extends StatelessWidget {
  final String id;
  const DrawerItems({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indexUser = Provider.of<ProviderUser>(context).getRecordById(id);
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      color: const Color.fromARGB(255, 77, 40, 77),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          itemExtent: 100,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 53, 28, 53),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                size: 40,
                color: Colors.white, // Set the icon color to white
              ),
              title: Text(
                indexUser!['name'],
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors
                        .white), // Increase font weight and set text color to white
              ),
              subtitle: Text(indexUser['email'],
                  style: const TextStyle(
                      color: Colors.white)), // Set subtitle text color to white
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.precision_manufacturing,
                  color: Colors.white), // Set the icon color to white
              title: const Text(
                'تامین کنندگان',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors
                        .white), // Increase font weight and set text color to white
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.work,
                  color: Colors.white), // Set the icon color to white
              title: const Text(
                'تولید کنندگان',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors
                        .white), // Increase font weight and set text color to white
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.engineering,
                  color: Colors.white), // Set the icon color to white
              title: const Text(
                'متخصصین فنی',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors
                        .white), // Increase font weight and set text color to white
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.edit,
                  color: Colors.white), // Set the icon color to white
              title: const Text(
                'ویرایش پروفایل',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors
                        .white), // Increase font weight and set text color to white
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout,
                  color: Colors.white), // Set the icon color to white
              title: const Text(
                'خروج',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors
                        .white), // Increase font weight and set text color to white
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
