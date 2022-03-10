import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:mon_projet/auth/login.dart';
import 'package:mon_projet/auth/signup_end.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? _name;
  String? _city;
  String? _phone;
  String? _username;
  String? _email;
  String? _password;
  String? _confirmPassword;
  bool _obscureText = true;

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String usernamePattern =
       r"^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$";
  String namePattern = r"^[a-zA-Z ]+$";
  String phonePattern = r"^(?=.{9}$)((6|2).*$)";

  String emailPattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";

  String passwordPattern =
      r"^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$";

  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  Widget _buildName() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 10), blurRadius: 50, color: Color(0xffEEEEEE))
          ]),
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
          labelText: "Name",
          prefixIcon: Icon(
            Icons.badge_rounded,
            color: Color(0xff2E1C4C),
          ),
          hintText: "Enter full name",
          hintStyle: TextStyle(
            color: Color(0xff707070),
            fontSize: 15,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Name is required.";
          }

          RegExp regex = RegExp(namePattern);
          if (!regex.hasMatch(value)) {
            return "Enter a valid name";
          }
          return null;
        },
        onSaved: (value) {
          _name = value;
        },
      ),
    );
  }

  Widget _buildCity() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 10), blurRadius: 50, color: Color(0xffEEEEEE))
          ]),
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
          labelText: "City",
          prefixIcon: Icon(
            Icons.location_pin,
            color: Color(0xff2E1C4C),
          ),
          hintText: "Enter city name",
          hintStyle: TextStyle(
            color: Color(0xff707070),
            fontSize: 15,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "City is required.";
          }

          return null;
        },
        onSaved: (value) {
          _city = value;
        },
      ),
    );
  }

  Widget _buildPhone() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 10), blurRadius: 50, color: Color(0xffEEEEEE))
          ]),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 10,
        right: 20,
        left: 20,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        enableSuggestions: true,
        decoration: const InputDecoration(
          labelText: "Phone",
          prefixIcon: Icon(
            Icons.phone,
            color: Color(0xff2E1C4C),
          ),
          hintText: "Enter phone number",
          hintStyle: TextStyle(
            color: Color(0xff707070),
            fontSize: 15,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Phone number is required.";
          }

          RegExp regex = RegExp(phonePattern);
          if (!regex.hasMatch(value)) {
            return "Enter a valid phone number";
          }
          return null;
        },
        onSaved: (value) {
          _phone = value;
        },
      ),
    );
  }

  Widget _buildUsername() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 10), blurRadius: 50, color: Color(0xffEEEEEE))
          ]),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 10,
        right: 20,
        left: 20,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        maxLength: 20,
        enableSuggestions: true,
        decoration: const InputDecoration(
          labelText: "Username",
          prefixIcon: Icon(
            Icons.person,
            color: Color(0xff2E1C4C),
          ),
          hintText: "Suggest a username",
          hintStyle: TextStyle(
            color: Color(0xff707070),
            fontSize: 15,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Username is required";
          }

          RegExp regex = RegExp(usernamePattern);
          if (!regex.hasMatch(value)) {
            return "Enter a valid username.\n"
                "Must be alphanumeric characters only.\n"
                "Must contain '_' or '.' inside but not outside.";
          }
          return null;
        },
        onSaved: (value) {
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
                offset: Offset(0, 10), blurRadius: 50, color: Color(0xffEEEEEE))
          ]),
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Email is required.";
          }

          RegExp regex = RegExp(emailPattern);
          if (!regex.hasMatch(value)) {
            return "Enter a valid email address";
          }

          return null;
        },
        onSaved: (value) {
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
                offset: Offset(0, 10), blurRadius: 50, color: Color(0xffEEEEEE))
          ]),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 20,
        right: 20,
        left: 20,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: _passwordController,
        obscureText: _obscureText,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: "Password",
          prefixIcon: const Icon(
            Icons.key,
            color: Color(0xff2E1C4C),
          ),
          hintText: "Enter password",
          hintStyle: const TextStyle(
            color: Color(0xff707070),
            fontSize: 15,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: const Color(0xff2E1C4C),
            ),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Password is required.";
          }

          RegExp regex = RegExp(passwordPattern);
          if (!regex.hasMatch(value)) {
            return "Enter a valid password address.\nMust be 8 characters or more and must contain \nat least 1 uppercase, 1 lowercase, 1 number, \n1 special character (~!@#\$%&*\\)";
          }
          return null;
        },
        onSaved: (value) {
          _password = value;
        },
      ),
    );
  }

  Widget _buildConfirmPassword() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 10), blurRadius: 50, color: Color(0xffEEEEEE))
          ]),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 20,
        right: 20,
        left: 20,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: _confirmPasswordController,
        obscureText: _obscureText,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: "Confirm Password",
          prefixIcon: const Icon(
            BootstrapIcons.key_fill,
            color: Color(0xff2E1C4C),
          ),
          hintText: "Re-enter password",
          hintStyle: const TextStyle(
            color: Color(0xff707070),
            fontSize: 15,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: const Color(0xff2E1C4C),
            ),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        validator: (value) {
          if (value != _passwordController.value.text) {
            return "Passwords do not match!";
          }
          return null;
        },
        onSaved: (value) {
          _confirmPassword = value;
        },
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                  ),
                  // color: Color(0xff2E1C4C)
                  gradient: LinearGradient(
                      colors: [Color(0xff3e3a77), Color(0xff2E1C4C)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      BootstrapIcons.person_plus_fill,
                      size: 100,
                      color: Colors.white,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        "Registration",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Intro text
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              child: const Text(
                "Hey there! Glad to have you here. First, we’ll need you to provide us some personal information. Classical!",
                style: TextStyle(
                  // color: Color(0xff707070),
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Form(
                key: _signUpFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildName(),
                    _buildEmail(),
                    _buildCity(),
                    _buildPhone(),
                    _buildUsername(),
                    _buildPassword(),
                    _buildConfirmPassword(),
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
                              fontStyle: FontStyle.italic),
                        ),
                        onTap: () => {},
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Login Button
                    Container(
                      height: 54,
                      alignment: Alignment.center,
                      margin:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
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
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(50)),
                      child: TextButton(
                          onPressed: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              debugPrint("All validations passed!");
                            //  Go to the next page...
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUpScreenEnd()
                                  )
                              );
                            }else{
                              debugPrint("Some validations failed... Checkout!");
                            }
                            _signUpFormKey.currentState!.save();
                          },
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )),
                    )
                  ],
                )),
            // No account yet
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 10, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff707070),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()))
                    },
                    child: const Text(
                      "Login",
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
