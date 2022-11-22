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

  Future<List<ProductItem>> getAllProducts() => apiProvider.getAllProducts();

  Future<List<ProductItem>> getAllCachedProducts({required int id}) =>
      apiProvider.getCachedProductsId(id: id);

  Future<List<CategoryItem>> getAllCategories() =>
      apiProvider.getAllCachedCategoryItem();

  Future<CachedProduct> insertCachedProducts(
      {required CachedProduct cachedProduct}) async {
    return await LocalDatabase.insertProduct(cachedProduct);
  }

  Future<List<CachedProduct>> getAllCacheProducts() async {
    return await LocalDatabase.getAllProducts();
  }

  Future<int> deleteCachedProductById({required int id}) async {
    return await LocalDatabase.deleteProductById(id);
  }

  Future<int> updateCachedProductById(
      {required int id, required CachedProduct cachedProduct}) async {
    return await LocalDatabase.updateProduct(
        id: id, cachedProduct: cachedProduct);
  }

  Future<int> updateCachedProductCountById({required int id, required int count}) async {
    return await LocalDatabase.updateProductCount(id: id, count: count);
  }

  Future<int> clearAllCachedProducts() async {
    return await LocalDatabase.deleteAllProducts();
  }
}
