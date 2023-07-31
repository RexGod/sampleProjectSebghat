// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class Product {
  final String nameTool;
  final String count;
  final String compName;
  final String brand;
  final String number;
  final String price;
  final String state;
  Product({
    required this.state,
    required this.nameTool,
    required this.count,
    required this.compName,
    required this.brand,
    required this.number,
    required this.price,
  });

}
class ProviderProduct with ChangeNotifier{
  
  List<Product> p1 = [
    Product(
        nameTool: 'سرسیلندر',
        count: '1',
        compName: 'سپاهان',
        brand: 'سپاهان',
        number: '20',
        price: '3400000',
        state: 'دسته دو'),
    Product(
        nameTool: 'سرسیلندر',
        count: '1',
        compName: 'ایران خودرو',
        brand: 'شاهین',
        number: '18',
        price: '3200000',
        state: 'نو')
  ];

  List<Product> searchByTool(String toolsName, String? state) {
    List<Product> searchResults = [];
    for (var product in p1) {
      if ((product.nameTool == toolsName && state == null) ||
          (product.nameTool == toolsName && product.state == state) ||
          (toolsName.isEmpty && product.state == state)) {
        searchResults.add(product);
      }
    }
    return searchResults;
  }
}