import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sample/View/myInquiry.dart';
import 'package:sample/View/widgets/Drawer.dart';
import 'package:sample/ViewModel/carsProvider.dart';
import 'package:sample/ViewModel/toolsProvider.dart';
import '../Model/cars.dart';

class Inquiry extends StatefulWidget {
  const Inquiry({Key? key});
  static const routeName = 'inquiry';

  @override
  State<Inquiry> createState() => _InquiryState();
}

class _InquiryState extends State<Inquiry> {
  int activeStep = 0;

  final carBrands = [
    'پژو',
    'ام‌وی‌ام',
    'چری',
    'کیا',
    'هیوندای',
    'رنو',
    'سوزوکی',
    'مزدا',
    'هوندا',
    'نیسان',
    'تویوتا',
    'لکسوس',
    'بنز',
    'پورشه',
    'بی ام و',
    'ام جی',
  ];
  final List<String> colors = [
    'نوک مدادی ',
    'مشکی',
    'سفید',
    'نقره ای',
  ];
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<FormState> _formKeytool = GlobalKey();
  String? selectedColor;
  String? selectedBrand;
  String? selectedCar;
  TextEditingController _idCarController = TextEditingController();
  TextEditingController _yearProductController = TextEditingController();
  List<Car> sampleCars = [
    Car(brand: 'پژو', model: 'پژو 206'),
    Car(brand: 'پژو', model: 'پژو 405'),
    Car(brand: 'ام‌وی‌ام', model: 'ام‌وی‌ام 315'),
    Car(brand: 'ام‌وی‌ام', model: 'ام‌وی‌ام 565'),
  ];
  String? selectedToolsType;
  final List<String> toolType = [
    'بدنه',
    'جلوبندی',
    'موتوری',
    'گیربکس',
    'لاستیک',
    'باطری',
    'اگزوز',
    'تسمه'
  ];
  final List<String> toolState = ['نو', 'دست دوم', 'هردو'];
  String? selectedSatate;
  TextEditingController _brandController = TextEditingController();
  TextEditingController _nameOftoolFieldController = TextEditingController();
  TextEditingController _numberOftoolController =
      TextEditingController(text: '1');

  final discript = '';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;

    void _submit() {
      if (!_formKey.currentState!.validate()) {
        return;
      } else {
        _formKey.currentState!.save();
        String date =
            Provider.of<ProviderCar>(context, listen: false).getCurrentDate();
        Provider.of<ProviderCar>(context, listen: false).addCar(
            id,
            _idCarController.text,
            selectedCar.toString(),
            _yearProductController.text,
            selectedBrand.toString(),
            selectedColor.toString(),
            date.toString());
      }
      ;
    }

    void _submitfortool() {
      if (!_formKey.currentState!.validate()) {
        return;
      } else {
        _formKey.currentState!.save();

        Provider.of<Providertool>(context, listen: false).addTool(
            id,
            selectedToolsType.toString(),
            _nameOftoolFieldController.text,
            _brandController.text,
            _numberOftoolController.text,
            selectedSatate.toString());
      }
      ;
    }

    List<Step> getSteps() => [
          Step(
            title: const Text('مرحله اول'),
            isActive: activeStep >= 0,
            content: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'استعلام قیمت',
                                  style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 25, horizontal: 80),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    activeStep += 1;
                                  });
                                },
                                child: const Text(' درخواست استعلام جدید',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600)),
                              ),
                              const SizedBox(height: 16.0),
                              const Text('یا',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 16.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 25, horizontal: 80),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      MyInquiry.routeName,
                                      arguments: id);
                                },
                                child: const Text('مشاهده استعلام های قبلی ',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Step(
            label: Text('ثبت خودرو'),
            title: const Text(
              'مرحله دوم',
            ),
            isActive: activeStep >= 1,
            content: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('مشخصات خودرو'),
                  const SizedBox(height: 20),
                  DropdownButton<String>(
                    hint: const Text('برند ماشین را انتخاب کنید'),
                    value: selectedBrand,
                    onChanged: (value) => setState(() {
                      selectedBrand = value;
                      selectedCar = null;
                    }),
                    items: carBrands.map(buildMenuItem).toList(),
                  ),
                  const SizedBox(height: 20),
                  DropdownButton<String>(
                    hint: const Text('مدل ماشین را انتخاب کنید'),
                    value: selectedCar,
                    onChanged: (value) => setState(() {
                      selectedCar = value;
                    }),
                    items: getCarNamesByBrand(selectedBrand)
                        .map(buildMenuItem)
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  DropdownButton<String>(
                    hint: const Text('رنگ ماشین را انتخاب کنید'),
                    value: selectedColor,
                    onChanged: (value) => setState(() {
                      selectedColor = value;
                    }),
                    items: getAvailableColors(selectedBrand, selectedCar)
                        .map((color) => DropdownMenuItem<String>(
                              value: color,
                              child: Text(color),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  const Text('سال ساخت'),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            onSaved: (newValue) {
                              _idCarController.text;
                            },
                            controller: _idCarController,
                            decoration: const InputDecoration(
                              hintText: 'سال ساخت',
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text('شماره شاسی'),
                          TextFormField(
                            onSaved: (newValue) {
                              _yearProductController.text;
                            },
                            controller: _yearProductController,
                            decoration: const InputDecoration(
                              hintText: 'شماره شاسی',
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submit,
                    child: const Text('ثبت خودرو'),
                  ),
                ],
              ),
            ),
          ),
          Step(
            title: const Text('مرحله سوم'),
            isActive: activeStep >= 2,
            label: const Text('ثبت قطعه'),
            content: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DropdownButton<String>(
                    hint: const Text('-نوع قطعه را وارد کنید-'),
                    value: selectedToolsType,
                    onChanged: (value) => setState(() {
                      selectedToolsType = value;
                    }),
                    items: toolType.map(buildMenuItem).toList(),
                  ),
                  const SizedBox(height: 16),
                  Form(
                      key: _formKeytool,
                      child: Column(
                        children: [
                          TextFormField(
                            onSaved: (newValue) {
                              _nameOftoolFieldController.text;
                            },
                            controller: _nameOftoolFieldController,
                            decoration:
                                const InputDecoration(hintText: 'نام قطعه'),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            onSaved: (newValue) {
                              _brandController.text;
                            },
                            controller: _brandController,
                            decoration: const InputDecoration(hintText: 'برند'),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            onSaved: (newValue) {
                              _numberOftoolController.text;
                            },
                            controller: _numberOftoolController,
                            decoration: const InputDecoration(),
                          ),
                        ],
                      )),
                  const SizedBox(height: 16),
                  DropdownButton<String>(
                    value: selectedSatate,
                    onChanged: (value) => setState(() {
                      selectedSatate = value;
                    }),
                    items: toolState.map(buildMenuItem).toList(),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitfortool,
                    child: const Text('ثبت قطعه'),
                  ),
                ],
              ),
            ),
          ),
          Step(
            title: const Text('پایان'),
            isActive: activeStep >= 3,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Center(
                  child: Material(
                    elevation: 4,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.32,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 1,
                          color: Colors.grey,
                          child: const Center(
                              child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              'در خواست استعلام شما با موفقیت ثبت شد',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          )),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            textAlign: TextAlign.justify,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            'نتیجه درخواست استعلام شما توسط تامین‌کنندگان پاسخ داده خواهد شد و در پروفایل شما قابل مشاهده خواهد بود',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  MyInquiry.routeName,
                                  arguments: id);
                            },
                            child: const Text('پاسخ استعلام')),
                        const SizedBox(
                          height: 10,
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ];
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
      body: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
          primary: Color(0xFFF57C00),
        )),
        child: Column(children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Flexible(
              child: Stepper(
                controlsBuilder: (context, details) {
                  bool isFirstStep = details.currentStep == 0;
                  bool islastStep = details.currentStep == 3;
                  return Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    child: Row(
                      children: [
                        if (!isFirstStep)
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: islastStep
                                  ? const Text('بازگشت')
                                  : const Text('مرحله قبل'),
                              onPressed: details.onStepCancel,
                            ),
                          ),
                        const SizedBox(width: 15),
                        if (!islastStep)
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: isFirstStep
                                  ? const Text('ادامه')
                                  : const Text('مرحله بعد'),
                              onPressed: details.onStepContinue,
                            ),
                          ),
                      ],
                    ),
                  );
                },
                elevation: 0,
                type: StepperType.horizontal,
                steps: getSteps(),
                currentStep: activeStep,
                onStepContinue: () {
                  setState(() {
                    activeStep += 1;
                  });
                },
                onStepCancel: () {
                  setState(() {
                    activeStep -= 1;
                  });
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String value) => DropdownMenuItem(
        value: value,
        child: Text(value),
      );
  List<String> getAvailableColors(String? brand, String? carName) {
    if (brand != null && carName != null) {
      return colors;
    } else {
      return [];
    }
  }

  // Method to get car names based on selected brand
  List<String> getCarNamesByBrand(String? brand) {
    if (brand == null) {
      return [];
    }
    return sampleCars
        .where((car) => car.brand == brand)
        .map((car) => car.model)
        .toList();
  }
}
