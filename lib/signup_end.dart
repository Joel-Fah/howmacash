import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class SignUpScreenEnd extends StatefulWidget {
  const SignUpScreenEnd({Key? key}) : super(key: key);

  @override
  _SignUpScreenEndState createState() => _SignUpScreenEndState();
}

class _SignUpScreenEndState extends State<SignUpScreenEnd> {
  int _value = 1;
  //Dropdowns
  String? valueChoose;
  List listItems = ["Advanced Level", "Ordinary Level"];
  List listItemsSubjects = [
    "Mathematics",
    "Physics",
    "Chemistry",
    "Computer Science",
    "Biology",
    "Further Maths",
  ];

  //Function definition for date picker
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
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ]),
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                top: 10,
                right: 20,
                left: 20,
              ),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: const TextField(
                cursorColor: Color(0xff2E1C4C),
                decoration: InputDecoration(
                    icon: Icon(
                      BootstrapIcons.file_earmark_font_fill,
                      color: Color(0xff2E1C4C),
                    ),
                    hintText: "Product Name",
                    hintStyle: TextStyle(color: Color(0xff707070)),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ]),
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                top: 10,
                right: 20,
                left: 20,
              ),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: const TextField(
                cursorColor: Color(0xff2E1C4C),
                decoration: InputDecoration(
                    icon: Icon(
                      BootstrapIcons.file_earmark_text_fill,
                      color: Color(0xff2E1C4C),
                    ),
                    hintText: "For which subject?",
                    hintStyle: TextStyle(color: Color(0xff707070)),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            Container(
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
                child: Row(
                  children: [
                    const Icon(
                      BootstrapIcons.file_earmark_ruled_fill,
                      color: Color(0xff2E1C4C),
                    ),
                    Expanded(
                      flex: 1,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(20),
                          // underline: SizedBox(), // This is to remove underline of dropdown filed - 2nd alternative
                          hint: const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text("Select from list"),
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
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(valueItem),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE))
                    ]),
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  top: 10,
                  right: 20,
                  left: 20,
                ),
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    const Icon(
                      BootstrapIcons.calendar2_event_fill,
                      color: Color(0xff2E1C4C),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        _date.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.only(
                          left: 30
                      ),
                      onPressed: () {
                        setState(() {
                          _selectDate(context);
                        });
                      },
                      icon: const Icon(BootstrapIcons.calendar3),
                    ),
                  ],
                )
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ]),
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                top: 10,
                right: 20,
                left: 20,
              ),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: const TextField(
                maxLines: 8,
                cursorColor: Color(0xff2E1C4C),
                decoration: InputDecoration(
                    icon: Icon(
                      BootstrapIcons.pen_fill,
                      color: Color(0xff2E1C4C),
                    ),
                    hintText: "Tell us something about you...",
                    hintStyle: TextStyle(color: Color(0xff707070)),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              child: Column(
                children: [
                  const Text(
                    "Business Size",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value as int;
                            });
                          }),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "I manage alone",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 2,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value as int;
                            });
                          }),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "0 - 5 engaged",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 3,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value as int;
                            });
                          }),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "6 - 15 engaged",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 4,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value as int;
                            });
                          }),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "More than 15 engaged",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => {},
              child: Container(
                // width: double.infinity,
                height: 54,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE))
                    ],
                    // color: Color(0xff2E1C4C),
                    gradient: const LinearGradient(
                        colors: [Color(0xff3e3a77), Color(0xff2E1C4C)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
            ),
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
                    onTap: () => {
                      showDialog<void>(
                        context: context,
                        barrierDismissible:
                            false, // false = user must tap button, true = tap outside dialog
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
