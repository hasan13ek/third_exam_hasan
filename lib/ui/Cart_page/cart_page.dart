import 'package:flutter/material.dart';
import 'package:third_exam/data/models/cached_product_model.dart';
import 'package:third_exam/data/repository/my_repository.dart';
import 'package:third_exam/ui/Cart_page/widget/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key, required this.myRepository}) : super(key: key);

  final MyRepository myRepository;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Savatcha"),
        actions: [
          TextButton(
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                          "Barcha mahsulotlarni o'chirmoqchimisiz?"),
                      actions: [
                        TextButton(
                          child: const Text('Ha'),
                          onPressed: () async {
                            await widget.myRepository.CLAllCachedProductsEr();
                            setState(() {});
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Yo'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
            },
            child: const Text(
              "Tozalash",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: FutureBuilder<List<CachedProduct>>(
        future: widget.myRepository.getAllCaceDProducts(),
        builder: (BuildContext context,
            AsyncSnapshot<List<CachedProduct>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            List<CachedProduct> data = snapshot.data!;
            var totalPrice = data.isNotEmpty?data.map((e) => (e.price * e.count)).reduce((value, element) => value + element,):0;
            return Column(
              children: [
                Expanded(
                    child: ListView(
                      children: List.generate(data.length, (index) {
                        var cachedItem = data[index];
                        return CartItemView(
                          cachedProduct: cachedItem,
                          onItemTap: () async {
                            await widget.myRepository.deleteCachedProductById(
                              id: cachedItem.id!,
                            );
                            setState(() {});
                          },
                        );
                      }),
                    )),
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          spreadRadius: 7,
                          color: Colors.grey.shade300,
                          offset: const Offset(1, 4),
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Umumiy summa  --->",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "\$ $totalPrice",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xff4047C1),
                        ),
                      )
                    ],
                  ),
                )
              ],
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
