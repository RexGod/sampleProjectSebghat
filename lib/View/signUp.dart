import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/View/login.dart';
import '../ViewModel/userProvider.dart';
import 'package:uuid/uuid.dart';
import '../ViewModel/validation.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
  static const routeName = 'signup';
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
      var id = const Uuid().v1();
      Provider.of<ProviderUser>(context, listen: false).addUser(
          id,
          _nameController.text,
          _emailController.text,
          _phoneController.text,
          _passwordController.text);
      _phoneController.clear();
      _nameController.clear();
      _passwordController.clear();
      _emailController.clear();
      Navigator.of(context).pushReplacementNamed(loginuser.routeName);
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    final validation = Provider.of<Setting>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  ' ساخت حساب کاربری',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Center(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    TextFormField(
                                      onSaved: (newValue) {
                                        _nameController.text;
                                      },
                                      validator: validation.validphoneNumber,
                                      controller: _phoneController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: 'شماره موبایل',
                                        prefixIcon: const Icon(Icons.phone),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    TextField(
                                      controller: _nameController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintText: 'نام خود را وارد کنید',
                                        prefixIcon: const Icon(Icons.email),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      onSaved: (newValue) {
                                        _emailController.text;
                                      },
                                      validator: validation.validateEmail,
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintText: 'ایمیل خود را وارد کنید',
                                        prefixIcon: const Icon(Icons.email),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      onSaved: (newValue) {
                                        _passwordController.text;
                                      },
                                      validator: validation.validatePassword,
                                      controller: _passwordController,
                                      obscureText: true, // star replaced
                                      decoration: InputDecoration(
                                        hintText: 'رمز عبور خود را وارد کنید',
                                        prefixIcon: const Icon(Icons.lock),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    ElevatedButton(
                                      onPressed: _submit,
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        backgroundColor: Color(0xFFF57C00),
                                      ),
                                      child: const Text(
                                        'ثبت نام حساب',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                            'در حال حاضر یک حساب کاربری دارید؟ '),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      loginuser.routeName);
                                            },
                                            child: Text('ورود'))
                                      ],
                                    )
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
