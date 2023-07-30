import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/View/home.dart';

import '../ViewModel/userProvider.dart';

class verificationUser extends StatelessWidget {
  final TextEditingController _codeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  static const routeName = 'verification';

  @override
  Widget build(BuildContext context) {
    final phone = ModalRoute.of(context)!.settings.arguments as String;
    final id = Provider.of<ProviderUser>(context, listen: false).findid(phone);
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification'),
      ),
      body: Padding(
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('تلفن همراه'),
                          SizedBox(height: 10),
                          TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              hintText: phone,
                              prefixIcon: const Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          const Text('لطفا کد دریافتی را وار کنید'),
                          const SizedBox(height: 10),
                          TextFormField(
                            onSaved: (newValue) {
                              _codeController.text as int;
                            },
                            controller: _codeController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'کد تایید',
                              prefixIcon: const Icon(Icons.verified),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                bool canAccess = Provider.of<ProviderUser>(
                                        context,
                                        listen: false)
                                    .isVerified(
                                        int.parse(_codeController.text));
                                if (canAccess) {
                                  Navigator.of(context).pushNamed(
                                      HomePage.routeName,
                                      arguments: id);
                                }
                              }
                            },
                            child: Text('هم اکنون وارد شوید '),
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
    );
  }
}
