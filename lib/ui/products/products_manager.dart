import '../../models/product.dart';
import 'package:flutter/foundation.dart';

class ProductsManager  with ChangeNotifier{
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Rượu apsinthion',
      description: 'Một loại rượu nhẹ và thích hợp trong những bữa tiệc nhỏ',
      price: 65,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/02020_0238_Absinthe_bottle.jpg/640px-02020_0238_Absinthe_bottle.jpg',
      isFavorite: true,
    ),   
    Product(
      id: 'p2',
      title: 'Energy Drink',
      description: 'Một lon nước sau những khoảng thời gian căng thẳng là một lựa chọn tuyệt vời cho bạn',
      price: 45,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Mega_Force_Energy_Drink.jpg/640px-Mega_Force_Energy_Drink.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p3',
      title: 'Dangyuja',
      description: 'một món ngon dành cho những ngày năng nóng',
      price: 50,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Danyuja-ade_%28dangyuja_beverage%29.jpg/640px-Danyuja-ade_%28dangyuja_beverage%29.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p4',
      title: 'Nước Chanh',
      description: 'Sự giải khát cho một ngày nắng nóng',
      price: 91,
      imageUrl:
          'https://cafefcdn.com/thumb_w/650/2018/2/3/photo1517622555691-1517622555691600774596.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p5',
      title: 'Nước giải khát',
      description: 'Những món đồ uống không thể bỏ qua vào mùa nóng',
      price: 49,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Milkshake_beverage_strawberry_drink-1021027.jpg/640px-Milkshake_beverage_strawberry_drink-1021027.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p6',
      title: 'Sweet olive pork',
      description: 
      'món ăn ngon với sự kết hợp hài hòa của nguyên liệu tự nhiên',
      price: 40,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Sweet_olive_pork_belly_crawfish%2C_chow_chow.jpg/640px-Sweet_olive_pork_belly_crawfish%2C_chow_chow.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p7',
      title: 'Street Food',
      description: 'một món ăn đường phố mang đầy tính nghệ thuật và thẩm mỹ',
      price: 10,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Delicious_Street_Food_-_2.jpg/640px-Delicious_Street_Food_-_2.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p8',
      title: 'Galician dumplings',
      description: 'Một trong những món ăn ngon vào ngày nghỉ',
      price: 21,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/02021_0459_%284%29_Galician_dumplings_as_a_symbolic_food_for_the_Lunar_New_Year.jpg/640px-02021_0459_%284%29_Galician_dumplings_as_a_symbolic_food_for_the_Lunar_New_Year.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p9',
      title: 'Thịt hấp',
      description: 'món ngon cho đại gia đình',
      price: 25,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Your_food%2C_your_health_01.jpg/640px-Your_food%2C_your_health_01.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p10',
      title: 'Mì xào',
      description: 'Một món ăn nhẹ ngon và bổ dưỡng',
      price: 43,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Subgum_chow_mein.jpg/640px-Subgum_chow_mein.jpg',
      isFavorite: true,
    ),
  ];

  int get itemCount {
    return _items.length;
  }

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id){
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product){
    _items.add(
      product.copyWith(
        id: 'p${DateTime.now().toIso8601String()}',
      ),
    );
    notifyListeners();
  }

  void updateProduct(Product product){
    final index = _items.indexWhere((item) => item.id == product.id);
    if (index >= 0){
      _items[index] = product;
      notifyListeners();
    }
  }

  void toggleFavoriteStatus(Product product){
    final savedStatus = product.isFavorite;
    product.isFavorite = !savedStatus;
  }

  void deleteProduct(String id){
    final index = _items.indexWhere((item) => item.id == id);
    _items.removeAt(index);
    notifyListeners();
  }
}