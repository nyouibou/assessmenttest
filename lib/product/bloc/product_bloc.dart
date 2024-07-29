// import 'package:assessmenttest/model/respmodel.dart';
// import 'package:assessmenttest/repository/apiservice.dart';
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:assessmenttest/model/respmodel.dart';
import 'package:assessmenttest/repository/apiservice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ApiService apiService;

  ProductBloc(this.apiService) : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await apiService.fetchProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError("Failed to load products"));
      }
    });
  }
}
