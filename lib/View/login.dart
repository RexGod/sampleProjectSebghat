import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/ViewModel/userProvider.dart';
import 'verification.dart';
import '../ViewModel/validation.dart';

class loginuser extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    final validation = Provider.of<Setting>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
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
                            onSaved: (newValue) {
                              _phoneController.text;
                            },
                            validator: validation.validphoneNumber,
                            controller: _phoneController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'شماره موبایل',
                              prefixIcon: const Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
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
                                    .login(_phoneController.text);
                                if (canAccess) {
                                  Navigator.of(context).pushNamed(
                                      verificationUser.routeName,
                                      arguments: _phoneController.text);
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
