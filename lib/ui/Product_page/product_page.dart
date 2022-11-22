import 'package:flutter/material.dart';
import 'package:third_exam/data/models/Categoryitem/category_item.dart';
import 'package:third_exam/data/models/Pproduct_item/product_item.dart';
import 'package:third_exam/data/models/cached_product_model.dart';
import 'package:third_exam/data/repository/my_repository.dart';
import 'package:third_exam/ui/Product_page/widget/product_item.dart';
class CategoryProScreen extends StatefulWidget {
  const CategoryProScreen({
    Key? key,
    required this.myRepository,
    required this.category,
  }) : super(key: key);

  final MyRepository myRepository;
  final CategoryItem category;

  @override
  State<CategoryProScreen> createState() => _CategoryProScreenState();
}

class _CategoryProScreenState extends State<CategoryProScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: FutureBuilder<dynamic>(
        future: Future.wait(
            [widget.myRepository.getAllCCatProducts(id: widget.category.id)]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            List<ProductItem> data = snapshot.data[0]! as List<ProductItem>;
            return GridView.count(
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 0.6,
              children: List.generate(data.length, (index) {
                var item = data[index];
                return ProductsIVi(
                  item: item,
                  onTap: () => addToBasket(item),
                );
              }),
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

  Future<void> addToBasket(ProductItem item) async {
    int count = 0;
    List<CachedProduct> savedProducts = await widget.myRepository.getAllCaceDProducts();
    bool beforeSaved = false;
    int savedId = 0;
    for (var element in savedProducts) {
      if (element.productId == item.id) {
        beforeSaved = true;
        savedId = element.id!;
        count = element.count;
      }
    }
    if (beforeSaved) {
      count += 1;
      await widget.myRepository.updateCProductByIdCI(
        id: savedId,
        cachedProduct: CachedProduct(
          imageUrl: item.imageUrl,
          price: item.price,
          count: count,
          name: item.name,
          productId: item.id,
        ),
      );
    } else {
      widget.myRepository.insertCCProduct(
        cachedProduct: CachedProduct(
          imageUrl: item.imageUrl,
          price: item.price,
          count: 1,
          name: item.name,
          productId: item.id,
        ),
      );
    }
    final snackBar = SnackBar(
      content: const Text("Mahsulot savtga muvaffaqiyatli qo'shildi"),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}


