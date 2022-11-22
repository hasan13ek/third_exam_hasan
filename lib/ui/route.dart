import 'package:flutter/material.dart';
import 'package:third_exam/data/models/Categoryitem/category_item.dart';
import 'package:third_exam/data/repository/my_repository.dart';
import 'package:third_exam/ui/Navigation_bar/navigation_bar.dart';
import 'package:third_exam/ui/Product_page/product_page.dart';


import 'package:third_exam/utils/constants.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case tabsRoute:
        return MaterialPageRoute(
          builder: (_) => NavBar(),
        );
      case categoriesProductsRoute:
        return MaterialPageRoute(builder: (_) {
          var list = settings.arguments as List<dynamic>;
          MyRepository myRepository = list[0];
          CategoryItem categoryItem = list[1];
          return CategoryProScreen(
            myRepository: myRepository,
            category: categoryItem,
          );
        });
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
