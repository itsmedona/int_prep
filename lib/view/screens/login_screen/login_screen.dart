import 'package:flutter/material.dart';
import 'package:int_prep/core/constants/color_constants/color_constant.dart';
import 'package:int_prep/view/screens/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:int_prep/view/screens/register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                _buildTextField(
                  controller: _usernameController,
                  hintText: 'Username',
                  isPassword: false,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  isPassword: true,
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavScreen(),
                          ));
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
                      'Login',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Don't have an Account?",
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
                                  builder: (context) => RegistrationScreen(),
                                ));
                          },
                          child: Text(
                            "Log In",
                          ))
                    ],
                  ),
                ),
              ],
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
/*
Container(
              width: MediaQuery.of(context).size.width,
              height: 550,
              decoration: BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      //   Heading(title: 'Login'),
                      SizedBox(
                        height: 10,
                      ),

                      Textfieldwidget(
                        controller: emailcontroller,
                        hinttext: 'Email'),
                      SizedBox(
                        height: 20,
                      ),
                      Textfieldwidget(
                        controller: passwordcontroller,
                        hinttext: 'Password'),
                      SizedBox(
                        height: 20,
                      ),
                      Authbutton(
                        colors: Color.fromARGB(255, 218, 18, 3),
                        ontap: () {
                           String email=emailcontroller.text.trim();
                String password=passwordcontroller.text.trim();

                FireBaseFunction().loginuser(email:email,password:password).then((response){
                  if(response==null){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Bottom()));
                  }else{
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(response)));
                  }

                });
                        },
                        title: 'LOGIN',
                        textcolor: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Textbuttonwidget(
                          firsttext: 'Dont have an account?',
                          ontap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Signup()));
                          },
                          buttontext: 'Sign Up'),
                      Divider(
                        height: 10,
                        endIndent: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
*/