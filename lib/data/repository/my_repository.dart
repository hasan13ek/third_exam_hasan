import 'package:third_exam/data/models/cached_product_model.dart';
import 'package:third_exam/data/Local_database/local_data.dart';
import 'package:third_exam/data/api/api.dart';
import 'package:third_exam/data/models/Categoryitem/category_item.dart';
import 'package:third_exam/data/models/Pproduct_item/product_item.dart';

class MyRepository {
  MyRepository({
    required this.apiProvider,
  });

  final MyApi apiProvider;

  Future<List<ProductItem>> getAllProducts() => apiProvider.getAllPpro();

  Future<List<ProductItem>> getAllCCatProducts({required int id}) =>
      apiProvider.getCProductsC(id: id);

  Future<List<CategoryItem>> getAllCategories() =>
      apiProvider.getAllCC();

  Future<CachedProduct> insertCCProduct(
      {required CachedProduct cachedProduct}) async {
    return await LocalDatabase.insertProduct(cachedProduct);
  }

  Future<List<CachedProduct>> getAllCaceDProducts() async {
    return await LocalDatabase.getAllProducts();
  }

  Future<int> deleteCachedProductById({required int id}) async {
    return await LocalDatabase.deleteProductById(id);
  }

  Future<int> updateCProductByIdCI(
      {required int id, required CachedProduct cachedProduct}) async {
    return await LocalDatabase.updateProduct(
        id: id, cachedProduct: cachedProduct);
  }

  Future<int> updateCProductCT({required int id, required int count}) async {
    return await LocalDatabase.updateProductCount(id: id, count: count);
  }

  Future<int> CLAllCachedProductsEr() async {
    return await LocalDatabase.deleteAllProducts();
  }
}
