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

class ProviderProduct with ChangeNotifier {
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
        count: '2',
        compName: 'ایران خودرو',
        brand: 'شاهین',
        number: '18',
        price: '3200000',
        state: 'نو'),
    Product(
        nameTool: 'کاپوت',
        count: '1',
        compName: 'ایران خودرو',
        brand: 'پژو',
        number: '2',
        price: '3800000',
        state: 'نو'),
    Product(
        nameTool: 'تسمه تایم',
        count: '1',
        compName: 'ایران خودرو',
        brand: 'سمند',
        number: '18',
        price: '3200000',
        state: 'نو'),
    Product(
        nameTool: 'گل گیر',
        count: '1',
        compName: 'ایران خودرو',
        brand: 'سمند',
        number: '18',
        price: '3200000',
        state: 'دست دو'),
    Product(
        nameTool: 'سپر',
        count: '1',
        compName: 'سایپا',
        brand: 'پراید',
        number: '18',
        price: '3200000',
        state: 'دست دو'),
    Product(
        nameTool: 'سرسیلندر',
        count: '3',
        compName: 'سایپا',
        brand: 'کوییک',
        number: '18',
        price: '3200000',
        state: 'نو'),
    Product(
        nameTool: 'چراغ جلو',
        count: '1',
        compName: 'ایران خودرو',
        brand: 'پژو',
        number: '150',
        price: '120000',
        state: 'نو'),
    Product(
        nameTool: 'چراغ جلو',
        count: '2',
        compName: 'سایپا',
        brand: 'ساینا',
        number: '150',
        price: '120000',
        state: 'نو'),
    Product(
        nameTool: 'کاپوت',
        count: '2',
        compName: 'ایران خودرو',
        brand: 'شاهین',
        number: '18',
        price: '3200000',
        state: 'نو'),
    Product(
        nameTool: 'گل گیر',
        count: '2',
        compName: 'سایپا',
        brand: 'پراید',
        number: '18',
        price: '3200000',
        state: 'نو'),
    Product(
        nameTool: 'کاپوت',
        count: '3',
        compName: 'ایران خودرو',
        brand: 'وانت بار',
        number: '18',
        price: '3200000',
        state: 'دست دو'),
    Product(
        nameTool: 'سرسیلندر',
        count: '1',
        compName: 'کرمان موتور',
        brand: 'فیدلیتی',
        number: '18',
        price: '32000000',
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
