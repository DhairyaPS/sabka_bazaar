import 'package:get/get.dart';
import 'package:sabka_bazaar/services/http_service.dart';
import 'package:sabka_bazaar/utils/constants/constants.dart';
import 'package:sabka_bazaar/models/product_list_model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = [].obs;
  
  late List<Product>? selectedCategory = [];

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await HttpService.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }

  int getCurrentCountfor(String category) {
    SelectedCategory selectedCategory = SelectedCategory.foodAndVeg;
    int countValue = 0;
    switch (category) {
      case 'Fruits & Vegetables':
        selectedCategory = SelectedCategory.foodAndVeg;
        countValue = getProductsFor(selectedCategory)!.length;
        break;
      case 'Bakery, Cakes and Dairy':
        selectedCategory = SelectedCategory.bakery;
        countValue = getProductsFor(selectedCategory)!.length;
        break;
      case 'Beverages':
        selectedCategory = SelectedCategory.beverages;
        countValue = getProductsFor(selectedCategory)!.length;
        break;
      case 'Beauty and Hygiene':
        selectedCategory = SelectedCategory.beauty;
        countValue = getProductsFor(selectedCategory)!.length;
        break;
      case 'Baby Care':
        selectedCategory = SelectedCategory.babycare;
        countValue = getProductsFor(selectedCategory)!.length;
        break;
    }
    return countValue;
  }

  List<Product>? getProductsFor(SelectedCategory category) {
    switch (category) {
      case SelectedCategory.foodAndVeg:
        Item value = productList.firstWhere((element) =>
          element.name == 'Fruits and Vegetables',
          orElse: () {
            return null;
            });
        selectedCategory = value.products;
        break;
      case SelectedCategory.bakery:
      Item value = productList.firstWhere((element) =>
          element.name == 'Bakery, Cakes and Dairy',
          orElse: () {
            return null;
            });
        selectedCategory = value.products;
        break;
      case SelectedCategory.beverages:
        Item value = productList.firstWhere((element) =>
          element.name == 'Beverages',
          orElse: () {
            return null;
            });
        selectedCategory = value.products;
        break;
      case SelectedCategory.beauty:
      Item value = productList.firstWhere((element) =>
          element.name == 'Beauty and Hygiene',
          orElse: () {
            return null;
            });
        selectedCategory = value.products;
        break;
      case SelectedCategory.babycare:
      Item value = productList.firstWhere((element) =>
          element.name == 'Baby Care',
          orElse: () {
            return null;
            });
        selectedCategory = value.products;
        break;
    }
    return selectedCategory;
  }
}
