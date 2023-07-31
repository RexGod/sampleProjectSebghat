import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/Model/product.dart';

import '../Model/tools.dart';
import '../ViewModel/toolsProvider.dart';

class Resualt extends StatelessWidget {
  const Resualt({super.key});
  static const routName = 'resualt';
  @override
  Widget build(BuildContext context) {
    final List<Product> listProduct = Provider.of<ProviderProduct>(context).p1;

    final id = ModalRoute.of(context)!.settings.arguments as String;
    final List<Tools> listTool = Provider.of<Providertool>(context).toolList;
    final Tools? findtool =
        Provider.of<Providertool>(context).searchToolById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Column(
        children: [
          Table(
            border: TableBorder.all(),
            children: [
              const TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text('نوع')),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text('برند')),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text('نام قطعه')),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text('تعداد')),
                    ),
                  ),
                ],
              ),
              ...listTool.map((tools) {
                return TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text(tools.type)),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text(tools.brand)),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text(tools.name)),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          tools.number,
                        )),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ],
          ),
          Table(
            border: TableBorder.all(),
            children: [
              const TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text('شماره')),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text('شرکت')),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text('برند')),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text('تعداد')),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text('قیمت')),
                    ),
                  ),
                ],
              ),
              ...listProduct.map((product) {
                return TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text(product.count)),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text(product.compName)),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text(product.brand)),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            product.number,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            product.price,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ],
          ),
        ],
      ),
    );
  }
}
