import 'package:flutter/material.dart';
import 'package:third_exam/data/models/Categoryitem/category_item.dart';
import 'package:third_exam/data/repository/my_repository.dart';
import 'package:third_exam/ui/Category_page/widget/categorey_item.dart';
import 'package:third_exam/utils/constants.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required this.myRepository})
      : super(key: key);

  final MyRepository myRepository;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategoryalar ro'yxati"),
      ),
      body: FutureBuilder<List<CategoryItem>>(
        future: widget.myRepository.getAllCategories(),
        builder:
            (BuildContext context, AsyncSnapshot<List<CategoryItem>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            List<CategoryItem> data = snapshot.data!;
            return ListView(
              children: List.generate(data.length, (index) {
                return CategoryIK(
                  categoryItem: data[index],
                  onTap: () {
                    Navigator.pushNamed(
                        context, categoriesProductsRoute, arguments: [widget.myRepository, data[index],
                    ],
                    );
                  },
                );
              },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
