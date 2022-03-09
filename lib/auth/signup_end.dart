import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:mon_projet/date_time.dart';
import 'package:flutter/services.dart';
import 'package:mon_projet/splash.dart';

class SignUpScreenEnd extends StatefulWidget {
  const SignUpScreenEnd({Key? key}) : super(key: key);

  @override
  _SignUpScreenEndState createState() => _SignUpScreenEndState();
}

class _SignUpScreenEndState extends State<SignUpScreenEnd> {
  //Dropdowns
  String? valueChoose;
  String? valueChooseSubject;
  List listItems = ["Advanced Level", "Ordinary Level"];
  List listItemsSubjects = [
    "Pure Mathematics",
    "Physics",
    "Chemistry",
    "Computer Science",
    "Biology",
    "Further Maths",
  ];


  String? _productName;
  String? _level;
  String? _subject;
  String? _about;
  String? _size;

  String sizePattern = r"^[0-9]*$";


  //Function definition for date picker
  TextEditingController dateCtrl = TextEditingController();
  DateTime _date = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? _datePicker = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1920),
      lastDate: DateTime(2030),
    );
    //  Check if date is null or not
    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
      });
    }
  }

  final GlobalKey<FormState> _signUpEndFormKey = GlobalKey<FormState>();

  Widget _buildProductName() {
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
          labelText: "Product name",
          prefixIcon: Icon(
            BootstrapIcons.file_earmark_font_fill,
            color: Color(0xff2E1C4C),
          ),
          hintText: "Enter product name",
          hintStyle: TextStyle(
            color: Color(0xff707070),
            fontSize: 15,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Product name is required.";
          }

          return null;
        },
        onSaved: (value) {
          _productName = value;
        },
      ),
    );
  }

  Widget _buildLevel(){
    return Container(
        margin: const EdgeInsets.only(
          top: 10,
          right: 20,
          left: 20,
        ),
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: const Color(0xffEEEEEE),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 2),
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                BootstrapIcons.file_earmark_ruled_fill,
                color: Color(0xff2E1C4C),
              ),
            ),
            // borderRadius: BorderRadius.circular(20),
            // underline: SizedBox(), // This is to remove underline of dropdown filed - 2nd alternative
            hint: const Padding(
              padding: EdgeInsets.only(left: 0),
              child: Text("Select level"),
            ),
            // dropdownColor: Colors.grey[200],
            icon: const Icon(
              BootstrapIcons.caret_down_fill,
              // size: 20,
            ),
            iconSize: 20,
            isExpanded: true,
            value: valueChoose,
            onChanged: (newValue) {
              setState(() {
                valueChoose = newValue as String;
              });
            },
            items: listItems.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(valueItem),
                ),
              );
            }).toList(),
            validator: (value){
              if (value == null){
                return "Select an option from list";
              }
              return null;
            },
            onSaved: (value) {
              _level = value as String?;
            },
          ),
        )
    );
  }

  Widget _buildSubject(){
    return Container(
        margin: const EdgeInsets.only(
          top: 10,
          right: 20,
          left: 20,
        ),
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: const Color(0xffEEEEEE),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 2),
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                BootstrapIcons.file_earmark_text_fill,
                color: Color(0xff2E1C4C),
              ),
            ),
            // borderRadius: BorderRadius.circular(20),
            // underline: SizedBox(), // This is to remove underline of dropdown filed - 2nd alternative
            hint: const Padding(
              padding: EdgeInsets.only(left: 0),
              child: Text("Select subject"),
            ),
            // dropdownColor: Colors.grey[200],
            icon: const Icon(
              BootstrapIcons.caret_down_fill,
              // size: 20,
            ),
            iconSize: 20,
            isExpanded: true,
            value: valueChooseSubject,
            onChanged: (newValue) {
              setState(() {
                valueChooseSubject = newValue as String;
              });
            },
            items: listItemsSubjects.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(valueItem),
                ),
              );
            }).toList(),
            validator: (value){
              if (value == null){
                return "Select a subject from list";
              }
              return null;
            },
            onSaved: (value) {
              _subject = value as String?;
            },
          ),
        )
    );
  }

  Widget _buildDateCreated(){
    return BasicDateTimeField();
  }

  Widget _buildAbout() {
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
          labelText: "Bio",
          prefixIcon: Icon(
            BootstrapIcons.pen_fill,
            color: Color(0xff2E1C4C),
          ),
          hintText: "Tell us something about you...",
          hintStyle: TextStyle(
            color: Color(0xff707070),
            fontSize: 15,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        maxLength: 200,
        maxLines: 5,
        validator: (value) {
          if (value == null || value.isEmpty) {
            // return "Bio is required.";
            value = "Nothing mentioned";
          }

          return null;
        },
        onSaved: (value) {
          _about = value;
        },
      ),
    );
  }

  Widget _buildBusinessSize() {
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
        maxLength: 2,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        keyboardType: TextInputType.number,
        enableSuggestions: true,
        decoration: const InputDecoration(
          labelText: "Business Size",
          prefixIcon: Icon(
            BootstrapIcons.people_fill,
            color: Color(0xff2E1C4C),
          ),
          hintText: "1, 2, 3 or more?",
          hintStyle: TextStyle(
            color: Color(0xff707070),
            fontSize: 15,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Size is required.";
          }
          if (value as int < 0){
            return "Cannot be negative";
          }

          RegExp regex = RegExp(sizePattern);
          if (!regex.hasMatch(value)) {
            return "Enter a valid number";
          }

          return null;
        },
        onSaved: (value) {
          _size = value;
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
              height: 250,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                  ),
                  // color: Color(0xff2E1C4C)
                  gradient: LinearGradient(
                      colors: [Color(0xff6C63FF), Color(0xff2E1C4C)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      BootstrapIcons.file_earmark_plus,
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
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              child: const Text(
                "You’re almost there. Now we need some basic information about your business.",
                style: TextStyle(
                  // color: Color(0xff707070),
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Form(
              key: _signUpEndFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildProductName(),
                  _buildLevel(),
                  _buildSubject(),
                  _buildDateCreated(),
                  _buildAbout(),
                  _buildBusinessSize(),
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
                          if (_signUpEndFormKey.currentState!.validate()) {
                            debugPrint("All validations passed!");
                            //  Go to the next page...
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SplashScreen()
                                )
                            );
                          }else{
                            debugPrint("Some validations failed... Checkout!");
                          }
                          _signUpEndFormKey.currentState!.save();
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )),
                  )
                ],
              )
            ),
            // Why do we need this..?
            Container(
              margin: const EdgeInsets.only(
                  top: 5,
                  right: 20,
                  bottom: 10
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () =>
                    {
                      showDialog<void>(
                        context: context,
                        barrierDismissible:
                        false,
                        // false = user must tap button, true = tap outside dialog
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            title: const Text(
                              'Why do we need this information?',
                              style: TextStyle(
                                  color: Color(0xff2E1C4C),
                                  fontWeight: FontWeight.w600),
                            ),
                            content: const Text(
                              'We use them to carry out analytics and statistics to accompany you in your day to day business transactions. Keep calm, they\'re confidential and secured!',
                              textAlign: TextAlign.justify,
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Ok'),
                                onPressed: () {
                                  Navigator.of(dialogContext)
                                      .pop(); // Dismiss alert dialog
                                },
                              ),
                            ],
                          );
                        },
                      )
                    },
                    child: const Text(
                      "Why do we need this information? ",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff2E1C4C),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const Icon(
                    BootstrapIcons.info_circle,
                    size: 11,
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
