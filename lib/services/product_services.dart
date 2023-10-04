import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getx_tute/models/ApiProducts.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  Future getProducts() async {
    var res =
        await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));

    try {
      if (res.statusCode == 200) {
        var jsonString = jsonDecode(res.body) as List;
        List<Products> data =
            jsonString.map((e) => Products.fromJson(e)).toList();
        // debugPrint(data.toString());
        return data;
      } else {
        // show error message
        debugPrint('Error -getProducts- ProductServices');
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }

    // return products;
  }
}
