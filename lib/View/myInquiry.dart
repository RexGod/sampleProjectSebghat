import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/View/inquiry.dart';
import 'package:sample/View/resualt.dart';
import 'package:sample/View/widgets/Drawer.dart';
import 'package:sample/ViewModel/carsProvider.dart';

import '../Model/cars.dart';

class MyInquiry extends StatelessWidget {
  static const routeName = 'myinquiry';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final List<Car> listCar = Provider.of<ProviderCar>(context).carList;

    print("ListCar Length: ${listCar.length}");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 53, 28, 53),
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
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Align(
                  child: Text(
                    'لیست استعلام های من',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  alignment: Alignment.topRight),
              SizedBox(
                height: 20,
              ),
              listCar.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'داده ای وجود ندارد',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(
                                    Inquiry.routeName,
                                    arguments: id);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Color(0xFFF57C00),
                              ),
                              child: const Text(
                                'افزودن استعلام',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Table(
                      border: TableBorder.all(),
                      children: [
                        const TableRow(
                          children: [
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text('تاریخ')),
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
                                child: Center(child: Text('مدل')),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text('سال ساخت')),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text('نتیجه استعلام')),
                              ),
                            ),
                          ],
                        ),
                        ...listCar.map((car) {
                          return TableRow(
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(child: Text(car.date ?? '')),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(child: Text(car.brand)),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(child: Text(car.model)),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    car.years_of_Produce ?? '',
                                  )),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                            Resualt.routName,
                                            arguments: id);
                                      },
                                      child: const Text(
                                        'مشاهده استعلام',
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
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
      ),
    );
  }
}
