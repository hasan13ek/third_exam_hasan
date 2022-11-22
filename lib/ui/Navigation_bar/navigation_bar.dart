import 'package:flutter/material.dart';
import 'package:third_exam/data/api/api.dart';
import 'package:third_exam/data/repository/my_repository.dart';
import 'package:third_exam/ui/Cart_page/cart_page.dart';
import 'package:third_exam/ui/Category_page/categorey_page.dart';



class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;
  late MyRepository myRepository;
  List<Widget> screens = [];

  @override
  void initState() {
    myRepository = MyRepository(
      apiProvider: MyApi(),
    );

    screens = [
      CategoryScreen(myRepository: myRepository),
      CartScreen(myRepository: myRepository),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        iconSize: 24,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.green),
        items: [
          getItem(icon: Icons.category_rounded, labelText: "Kategoriya"),
          getItem(icon: Icons.shopping_basket_rounded, labelText: "Savat"),
        ],
      ),
    );
  }

  BottomNavigationBarItem getItem({required IconData icon, required String labelText}) {
    return BottomNavigationBarItem(
        label: labelText,
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        activeIcon: Icon(
          icon,
          color: Colors.white,
        ));
  }
}
