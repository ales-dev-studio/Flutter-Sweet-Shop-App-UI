import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sweet_shop_app_ui/features/cart_feature/data/models/cart_item_model.dart';
import 'package:flutter_sweet_shop_app_ui/features/cart_feature/data/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<CartItemModel> _items = [];

  void loadCart() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      emit(_buildLoadedState());
    });
  }

  void addItem(ProductModel product) {
    final existingIndex = _items.indexWhere(
          (item) => item.product.id == product.id,
    );

    if (existingIndex >= 0) {
      // Item exists, increment quantity
      _items[existingIndex] = _items[existingIndex].copyWith(
        quantity: _items[existingIndex].quantity + 1,
      );
    } else {
      // New item
      _items.add(CartItemModel(product: product, quantity: 1));
    }

    emit(_buildLoadedState());
  }

  void removeItem(int productId) {
    _items.removeWhere((item) => item.product.id == productId);
    emit(_buildLoadedState());
  }

  void updateQuantity(int productId, int quantity) {
    if (quantity <= 0) {
      removeItem(productId);
      return;
    }

    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      _items[index] = _items[index].copyWith(quantity: quantity);
      emit(_buildLoadedState());
    }
  }

  void incrementQuantity(int productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + 1,
      );
      emit(_buildLoadedState());
    }
  }

  void decrementQuantity(int productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      final newQuantity = _items[index].quantity - 1;
      if (newQuantity <= 0) {
        removeItem(productId);
      } else {
        _items[index] = _items[index].copyWith(quantity: newQuantity);
        emit(_buildLoadedState());
      }
    }
  }

  void clearCart() {
    _items.clear();
    emit(_buildLoadedState());
  }

  CartLoaded _buildLoadedState() {
    final totalAmount = _items.fold(0.0, (sum, item) => sum + item.totalPrice);
    final totalItems = _items.fold(0, (sum, item) => sum + item.quantity);

    return CartLoaded(
      items: List.from(_items),
      totalAmount: totalAmount,
      totalItems: totalItems,
    );
  }

  bool isProductInCart(int productId) {
    return _items.any((item) => item.product.id == productId);
  }
}
