part of 'product_bloc.dart';

// class ProductState {
//   List<RespModel> clist;
//   ProductState({required this.clist});
// }

// final class ProductInitial extends ProductState {
//   ProductInitial({required super.clist});
// }

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<RespModel> products;

  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}
