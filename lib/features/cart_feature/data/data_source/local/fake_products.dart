import 'package:flutter_sweet_shop_app_ui/features/cart_feature/data/models/product_model.dart';

import '../../../../../core/gen/assets.gen.dart';

class FakeProducts {
  static final List<ProductModel> products = [
    ProductModel(
      id: 0,
      name: 'Chocolate Cake',
      price: 99.99,
      imageUrl: Assets.images.birthdayCakeCategory1.path,
      rate: 6.5,
      weight: 1.5,
    ),
    ProductModel(
      id: 1,
      name: 'Strawberry Cake',
      price: 69.99,
      imageUrl: Assets.images.birthdayCakeCategory2.path,
      rate: 7.5,
      weight: 1.0,
    ),
    ProductModel(
      id: 2,
      name: 'Cherry cake',
      price: 49.99,
      imageUrl: Assets.images.birthdayCakeCategory3.path,
      rate: 6.5,
      weight: 1.5,
    ),
    ProductModel(
      id: 3,
      name: 'Strawberry cupcake',
      price: 39.99,
      imageUrl: Assets.images.cupcakeCategory1.path,
      rate: 7.5,
      weight: 1.5,
    ),
    ProductModel(
      id: 4,
      name: 'Cupcake',
      price: 40.00,
      imageUrl: Assets.images.cupcakeCategory2.path,
      rate: 9.3,
      weight: 1.5,
    ),
    ProductModel(
      id: 5,
      name: 'Cupcake',
      price: 50.00,
      imageUrl: Assets.images.cupcakeCategory3.path,
      rate: 8.5,
      weight: 0.5,
    ),
    ProductModel(
      id: 6,
      name: 'Sponge donut',
      price: 39.99,
      imageUrl: Assets.images.donutCategory1.path,
      rate: 6.5,
      weight: 1.5,
    ),
    ProductModel(
      id: 7,
      name: 'Chocolate donut',
      price: 29.99,
      imageUrl: Assets.images.donutCategory2.path,
      rate: 6.5,
      weight: 1.5,
    ),
    ProductModel(
      id: 7,
      name: 'Mix donut',
      price: 29.99,
      imageUrl: Assets.images.donutCategory3.path,
      rate: 6.5,
      weight: 1.5,
    ),
  ];
}
