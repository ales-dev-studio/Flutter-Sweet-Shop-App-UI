part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<CartItemModel> items;
  final double totalAmount;
  final int totalItems;

  CartLoaded({
    required this.items,
    required this.totalAmount,
    required this.totalItems,
  });

  CartLoaded copyWith({
    List<CartItemModel>? items,
    double? totalAmount,
    int? totalItems,
  }) {
    return CartLoaded(
      items: items ?? this.items,
      totalAmount: totalAmount ?? this.totalAmount,
      totalItems: totalItems ?? this.totalItems,
    );
  }
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}
