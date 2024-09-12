import 'package:flutter/material.dart';
import 'package:int_prep/view/screens/login_screen/login_screen.dart';

import '../../../core/constants/color_constants/color_constant.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String _gender = 'Male';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Register yourself'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/images/123.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: _nameController,
                      hintText: 'Enter your name',
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      controller: _numberController,
                      hintText: 'Enter your number',
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      controller: _emailController,
                      hintText: 'Enter your email',
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                      ),
                      value: _gender,
                      items: ['Male', 'Female', 'Other']
                          .map((String value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Select your gender',
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      controller: _passwordController,
                      hintText: 'Create password',
                      isPassword: true,
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm password',
                      isPassword: true,
                    ),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorConstant.primaryGreen),
                        child: Center(
                            child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Already have an Account?",
                            style: TextStyle(
                                color: ColorConstant.ShopsieGrey,
                                fontSize: 14,
                                height: 1.5),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ));
                              },
                              child: Text(
                                "Log In",
                              ))
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        border: OutlineInputBorder(),
        hintText: hintText,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter $hintText';
        }
        return null;
      },
    );
  }
}
