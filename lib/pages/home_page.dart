import 'package:flutter/material.dart';
import 'package:flutter_mini_project/pages/about_page.dart';
import 'package:flutter_mini_project/pages/add_user_page.dart';
import 'package:flutter_mini_project/pages/list_user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  List pages = [
    const ListUserPage(),
    const AddUserPage(),
    const AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.grey[600]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = 0;
                });
                print(pageIndex);
              },
              child: const Text(
                'List User',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = 1;
                });
                print(pageIndex);
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                  Text(
                    'New',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = 2;
                });
                print(pageIndex);
              },
              child: const Text(
                'About',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
