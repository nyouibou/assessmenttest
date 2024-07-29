// import 'dart:convert';

// import 'package:assessmenttest/model/respmodel.dart';
// import 'package:http/http.dart' as http;

// class Apiservice {
//   fetchData() async {
//     final response =
//         await http.get(Uri.parse("https://fakestoreapi.com/products"));
//     var jsonn = jsonDecode(response.body);
//     var respmain = RespModel.fromJson(jsonn);
//     var list = respmain.id;

//     return list;
//   }
// }

import 'dart:convert';
import 'package:assessmenttest/model/respmodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://fakestoreapi.com/products";

  Future<List<RespModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return respModelFromJson(response.body);
    } else {
      throw Exception("Failed to load products");
    }
  }
}
