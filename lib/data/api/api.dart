import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';
import 'package:third_exam/data/models/Categoryitem/category_item.dart';
import 'package:third_exam/data/models/Pproduct_item/product_item.dart';

class MyApi {
  Future<List<ProductItem>> getAllPpro() async {
    try {
      Response response = await https.get(Uri.parse("https://third-exam.free.mockoapp.net/products"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<ProductItem> products = (jsonData as List?)
                ?.map((item) => ProductItem.fromJson(item))
                .toList() ??
            [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<CategoryItem>> getAllCC() async {
    try {
      Response response = await https.get(Uri.parse("https://third-exam.free.mockoapp.net/categories"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var categories = (jsonData as List?)
                ?.map((element) => CategoryItem.fromJson(element))
                .toList() ??
            [];
        return categories;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ProductItem>> getCProductsC({required int id}) async {
    try {
      Response response = await https.get(Uri.parse("https://third-exam.free.mockoapp.net/categories/$id"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var products = (jsonData as List?)
                ?.map((element) => ProductItem.fromJson(element))
                .toList() ??
            [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}


