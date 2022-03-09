import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:mon_projet/auth/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _username;
  String? _email;
  String? _password;
  bool _obscureText = true;

  String usernamePattern = r"^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$";

  String emailPattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";

  String passwordPattern = r"^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$";

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  Widget _buildUsername() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: Color(0xffEEEEEE))
          ]
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 10,
        right: 20,
        left: 20,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        enableSuggestions: true,
        decoration: const InputDecoration(
          labelText: "Username",
          prefixIcon: Icon(
            BootstrapIcons.person_fill,
            color: Color(0xff2E1C4C),
          ),
          hintText: "Enter username",
          hintStyle: TextStyle(
              color: Color(0xff707070),
              fontSize: 15,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none
        ),
        validator: (value){
          if(value == null || value.isEmpty){
            return "Username is required.";
          }

          RegExp regex = RegExp(usernamePattern);
          if(!regex.hasMatch(value)){
            return "Enter a valid name";
          }
          return null;
        },
        onSaved: (value){
          _username = value;
        },
      ),
    );
  }

  Widget _buildEmail() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: Color(0xffEEEEEE))
          ]
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 20,
        right: 20,
        left: 20,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        enableSuggestions: true,
        autocorrect: true,
        decoration: const InputDecoration(
          labelText: "Email",
          prefixIcon: Icon(
            BootstrapIcons.at,
            color: Color(0xff2E1C4C),
          ),
          hintText: "Enter email",
          hintStyle: TextStyle(
              color: Color(0xff707070),
              fontSize: 15,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        validator: (value){
          if(value == null || value.isEmpty){
            return "Email is required.";
          }

          RegExp regex = RegExp(emailPattern);
          if(!regex.hasMatch(value)){
            return "Enter a valid email address";
          }

          return null;
        },
        onSaved: (value){
          _email = value;
        },
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: Color(0xffEEEEEE))
          ]
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 20,
        right: 20,
        left: 20,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        obscureText: _obscureText,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
            labelText: "Password",
            prefixIcon: const Icon(
              BootstrapIcons.key_fill,
              color: Color(0xff2E1C4C),
            ),
            hintText: "Enter password",
            hintStyle: const TextStyle(
              color: Color(0xff707070),
              fontSize: 15,
            ),
            suffixIcon: GestureDetector(
              onTap: (){
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                _obscureText ? BootstrapIcons.eye_slash_fill : BootstrapIcons.eye_fill,
                color: const Color(0xff2E1C4C),
              ),
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
        ),
        validator: (value){
          if(value == null || value.isEmpty){
            return "Password is required.";
          }

          RegExp regex = RegExp(passwordPattern);
          if(!regex.hasMatch(value)){
            return "Enter a valid password address.\nMust be 8 characters or more and must contain \nat least 1 uppercase, 1 lowercase, 1 number, \n1 special character (~!@#\$%&*\\)";
          }
          return null;
        },
        onSaved: (value){
          _password = value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                  ),
                  // color: Color(0xff2E1C4C)
                  gradient: LinearGradient(
                      colors: [Color(0xff6C63FF), Color(0xff2E1C4C)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                  )
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      BootstrapIcons.person_fill,
                      size: 100,
                      color: Colors.white,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              child: const Text(
                "Welcome back, nice to have you here. Please verify your identity and let’s start doing business.",
                style: TextStyle(
                  // color: Color(0xff707070),
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Form(
                key: _loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildUsername(),
                    _buildEmail(),
                    _buildPassword(),
                    // Forgot password
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(top: 5, right: 20),
                      child: GestureDetector(
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff2E1C4C),
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic
                          ),
                        ),
                        onTap: () => {},
                      ),
                    ),
                    const SizedBox(height: 10,),
                    // Login Button
                    Container(
                      height: 54,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                          top: 10,
                          left: 20,
                          right: 20
                      ),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE))
                          ],
                          // color: Color(0xff2E1C4C),
                          gradient: const LinearGradient(
                              colors: [Color(0xff6C63FF), Color(0xff2E1C4C)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: TextButton(
                          onPressed: (){
                            if(!_loginFormKey.currentState!.validate()){
                              return;
                            }
                            _loginFormKey.currentState!.save();
                            print("Username is " +_username!);
                            print("Email is "+_email!);
                            print("Password is "+_password!);
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                      ),
                    )
                  ],
                )
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 5,
                bottom: 10,
                right: 20
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Don't have an account yet? ",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff707070),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen()
                          )
                      )
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2E1C4C),
                          decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
