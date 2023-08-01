import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/Model/product.dart';
import 'package:sample/View/widgets/Drawer.dart';

import '../Model/tools.dart';
import '../ViewModel/toolsProvider.dart';

class Resualt extends StatelessWidget {
  const Resualt({super.key});
  static const routName = 'resualt';
  @override
  Widget build(BuildContext context) {
    final List<Tools> listTool = Provider.of<Providertool>(context).toolList;
    /* final String toolsName = Provider.of<Providertool>(context).
    final String? selectedState = arguments['selectedState']; */

    //final List<Product> filterProduct = Provider.of<ProviderProduct>(context).searchByTool(, state)
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final String toolsName =
        Provider.of<Providertool>(context, listen: false).getToolName(id);
    String? toolsState = Provider.of<Providertool>(context).getToolState(id);
    final List<Product> listProduct =
        Provider.of<ProviderProduct>(context, listen: false)
            .searchByTool(toolsName, toolsState);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 53, 28, 53),
        elevation: 0,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image.asset(
              'assets/logo.png',
              width: 100.0,
              height: 100.0,
            ),
          ),
        ),
      ),
      drawer: DrawerItems(
        id: id,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
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
            listProduct.isEmpty
                ? Center(
                    child: Text('محصولی یافت نشد'),
                  )
                : Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Text('مشخصات محصول'),
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
                                      child:
                                          Center(child: Text(product.compName)),
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
                  ),
          ],
        ),
      ),
    );
  }
}
