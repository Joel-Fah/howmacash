import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:intl/intl.dart';
import 'package:mon_projet/success_pages/success_order.dart';

class AddOrderPage extends StatefulWidget {
  const AddOrderPage({Key? key}) : super(key: key);

  @override
  State<AddOrderPage> createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  // Form variables
  String? _name;
  String? _city;
  String? _phone;
  String? _amount;
  String? _unitPrice;
  String? _addInfo;
  String? _total;
  String? _completed;

  int amountOrdered = 0;
  int unitPriceOrdered = 0;
  int totalOrdered = 0;

  String sizePattern = r"^[0-9]*$";
  String phonePattern = r"^(?=.{9}$)((6|2).*$)";

  final GlobalKey<FormState> _addOrderFormKey = GlobalKey<FormState>();

  // controller for each form field
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _totalController = TextEditingController();
  final TextEditingController _addInfoController = TextEditingController();
  final TextEditingController _completedController = TextEditingController();

  // Dispose controllers
  @override
  void dispose() {
    _nameController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    _amountController.dispose();
    _unitPriceController.dispose();
    _totalController.dispose();
    _addInfoController.dispose();
    _completedController.dispose();
    // Add code before the super
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Add code after super
    _nameController.addListener(_getName);
    _cityController.addListener(_getCity);
    _phoneController.addListener(_getPhone);
    _amountController.addListener(_getAmount);
    _unitPriceController.addListener(_getUnitPrice);
    _totalController.addListener(_getTotal);
    _addInfoController.addListener(_getAddInfo);
    _completedController.addListener(_getComplete);
  }

  // Get field names in string form
  _getName() {
    return _nameController.text.toString();
  }

  _getCity() {
    return _cityController.text.toString();
  }

  _getPhone() {
    return _phoneController.text.toString();
  }

  _getAmount() {
    return _amountController.text.toString();
  }

  _getUnitPrice() {
    return _unitPriceController.text.toString();
  }

  _getTotal() {
    return _totalController.text.toString();
  }

  _getAddInfo() {
    return _addInfoController.text.toString();
  }

  _getComplete() {
    return _completedController.text.toString();
  }

  // Form Widgets
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
        top: 15,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: _nameController,
        textCapitalization: TextCapitalization.words,
        enableSuggestions: true,
        decoration: const InputDecoration(
            labelText: "Customer Name",
            hintText: "Enter customer name",
            hintStyle: TextStyle(
              color: Color(0xff707070),
              fontSize: 15,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Customer name is required.";
          }

          return null;
        },
        onChanged: (value) {
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
        top: 15,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: _cityController,
        textCapitalization: TextCapitalization.sentences,
        enableSuggestions: true,
        decoration: const InputDecoration(
            labelText: "City/Quarter",
            hintText: "Customer Location",
            hintStyle: TextStyle(
              color: Color(0xff707070),
              fontSize: 15,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none),
        onChanged: (value) {
          _city = value;
          if (value.isEmpty) {
            _city = "N/A";
          }
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
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: _phoneController,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        keyboardType: TextInputType.phone,
        enableSuggestions: true,
        decoration: const InputDecoration(
            labelText: "Phone number",
            hintText: "Enter phone number",
            hintStyle: TextStyle(
              color: Color(0xff707070),
              fontSize: 15,
            ),
            prefixText: "+237 ",
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none),
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
        onChanged: (value) {
          _phone = value;
        },
      ),
    );
  }

  Widget _buildDateOrdered() {
    return OrderDateTimeField();
  }

  Widget _buildDateDelivery() {
    return DeliveryDateTimeField();
  }

  Widget _buildAmount() {
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
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        keyboardType: TextInputType.number,
        controller: _amountController,
        enableSuggestions: true,
        decoration: const InputDecoration(
            labelText: "Amount Printed",
            hintText: "1, 2, 3 or more?",
            hintStyle: TextStyle(
              color: Color(0xff707070),
              fontSize: 15,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Required.";
          }
          // if (value as int < 0){
          //   return "Cannot be negative";
          // }

          RegExp regex = RegExp(sizePattern);
          if (!regex.hasMatch(value)) {
            return "Enter a valid number";
          }

          return null;
        },
        onChanged: (value) {
          _amount = value;
          if (value.isEmpty) {
            setState(() => amountOrdered = 0);
          } else {
            setState(() {
              amountOrdered = int.parse(value);
            });
          }
        },
      ),
    );
  }

  Widget _buildUnitPrice() {
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
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        keyboardType: TextInputType.number,
        controller: _unitPriceController,
        enableSuggestions: true,
        decoration: const InputDecoration(
            labelText: "Unit Price",
            hintText: "Price",
            hintStyle: TextStyle(
              color: Color(0xff707070),
              fontSize: 15,
            ),
            suffixText: "XAF",
            suffixStyle: TextStyle(color: Colors.green),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Required.";
          }
          // if (value as int < 0){
          //   return "Cannot be negative";
          // }

          RegExp regex = RegExp(sizePattern);
          if (!regex.hasMatch(value)) {
            return "Enter a valid number";
          }

          return null;
        },
        onChanged: (value) {
          _unitPrice = value;
          if (value.isEmpty) {
            setState(() => unitPriceOrdered = 0);
          } else {
            setState(() {
              unitPriceOrdered = int.parse(value);
            });
          }
        },
      ),
    );
  }

  calculateTotal() {
    return "${amountOrdered * unitPriceOrdered}";
  }

  Widget _buildTotal() {
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
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: _totalController,
        readOnly: true,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        keyboardType: TextInputType.number,
        enableSuggestions: true,
        decoration: InputDecoration(
          labelText: "Total",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: calculateTotal(),
          hintStyle: const TextStyle(
            color: Color(0xff707070),
            fontSize: 15,
          ),
          suffixText: "XAF",
          suffixStyle: const TextStyle(color: Colors.green),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
        onChanged: (value) {
          setState(() {
            value = calculateTotal();
            _total = value;
          });
        },
      ),
    );
  }

  Widget _buildAdditionalInfo() {
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
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: _addInfoController,
        textCapitalization: TextCapitalization.sentences,
        enableSuggestions: true,
        decoration: const InputDecoration(
          labelText: "Additional Info",
          hintText: "Anything to add about this customer?",
          hintStyle: TextStyle(
            color: Color(0xff707070),
            fontSize: 15,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        maxLength: 200,
        maxLines: 5,
        onChanged: (value) {
          _addInfo = value;
          if (value.isEmpty) {
            _addInfo = "N/A";
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "In-Stocks",
              style: TextStyle(fontFamily: 'Autodestruct BB'),
            ),
            backgroundColor: const Color(0xff2E1C4C),
          ),
          body: Container(
            alignment: Alignment.center,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/order.svg",
                      height: 150.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: const [
                        Expanded(
                            child: Text(
                          "Current Order ID",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                        Text(
                          "ORDER0025",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      "Order Credentials (Form)",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2E1C4C)),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "It’s time to know who took what. Enter the necessary information and let’s track it out.",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 400.0,
                      child: Scrollbar(
                        controller: _controller,
                        isAlwaysShown: true,
                        child: SingleChildScrollView(
                          controller: _controller,
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Form(
                                key: _addOrderFormKey,
                                child: Column(
                                  children: [
                                    _buildName(),
                                    _buildPhone(),
                                    _buildCity(),
                                    _buildDateOrdered(),
                                    _buildDateDelivery(),
                                    Row(
                                      children: [
                                        Expanded(child: _buildAmount()),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(child: _buildUnitPrice()),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(child: _buildTotal()),
                                      ],
                                    ),
                                    _buildAdditionalInfo(),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // Finish Button
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          padding: const EdgeInsets.all(10.0),
                                        ),
                                        onPressed: () {
                                          if (_addOrderFormKey.currentState!
                                              .validate()) {
                                            if (_name != null) {
                                              debugPrint("Name: " + _name!);
                                            } else {
                                              debugPrint("No Name found!");
                                            }
                                            if (_city != null) {
                                              debugPrint(
                                                  "City name: " + _city!);
                                            } else {
                                              debugPrint("No city name found!");
                                            }
                                            if (_phone != null) {
                                              debugPrint("Phone: " + _phone!);
                                            } else {
                                              debugPrint("No phone found!");
                                            }
                                            if (_amount != null) {
                                              debugPrint("Amount: " + _amount!);
                                            } else {
                                              debugPrint(
                                                  "No amount name found!");
                                            }
                                            if (_unitPrice != null) {
                                              debugPrint(
                                                  "Unit Price: " + _unitPrice!);
                                            } else {
                                              debugPrint(
                                                  "No Unit Price found!");
                                            }
                                            if (_total != null) {
                                              debugPrint(
                                                  "Total Price: " + _total!);
                                            } else {
                                              debugPrint(
                                                  "No Total calculated!");
                                            }
                                            if (_addInfo != null) {
                                              debugPrint("Additional Info: " +
                                                  _addInfo!);
                                            } else {
                                              debugPrint(
                                                  "No Additional Info found!");
                                            }
                                            if (OrderDateTimeField
                                                    ._dateOrderCreated !=
                                                null) {
                                              debugPrint("Date ordered: " +
                                                  OrderDateTimeField
                                                      ._dateOrderCreated!);
                                            } else {
                                              debugPrint(
                                                  "No Order Date found!");
                                            }
                                            if (DeliveryDateTimeField
                                                    ._dateDeliveryCreated !=
                                                null) {
                                              debugPrint("Date Delivery: " +
                                                  DeliveryDateTimeField
                                                      ._dateDeliveryCreated!);
                                            } else {
                                              debugPrint(
                                                  "No Delivery Date found!");
                                            }
                                            //  Go to the next page...
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const SuccessOrderPage(),
                                              ),
                                            );
                                          } else {
                                            debugPrint(
                                                "Some validations failed... Checkout!");
                                          }
                                          _addOrderFormKey.currentState!.save();
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "Save Order",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Icon(Icons.save)
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //  TODO: Add a DraggableScrollableScrollView to enable user see recent/last stocks saved.
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

// Date Time classes
class OrderDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  static String? _dateOrderCreated;
  final TextEditingController _dateTimeOrderController =
      TextEditingController();

  void dispose() {
    _dateTimeOrderController.dispose();
  }

  void initState() {
    _dateTimeOrderController.addListener(_getDateOrdered);
  }

  _getDateOrdered() {
    return _dateTimeOrderController.text.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: Color(0xffEEEEEE),
            )
          ]),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 10,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(children: <Widget>[
        // Text('Basic date & time field (${format.pattern})'),
        DateTimeField(
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Date/Time ordered (${format.pattern})',
            hintText: "Select date and time",
            suffixIcon: const Icon(
              Icons.event,
              color: Color(0xff2E1C4C),
            ),
          ),
          format: format,
          onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.combine(date, time);
            } else {
              return currentValue;
            }
          },
          validator: (value) {
            if (value == null) {
              return "Ordered date is required";
            }
            return null;
          },
          onChanged: (value) {
            _dateOrderCreated = value.toString();
          },
        ),
      ]),
    );
  }
}

class DeliveryDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  static String? _dateDeliveryCreated;
  final TextEditingController _dateTimeDeliveryController =
      TextEditingController();

  void dispose() {
    _dateTimeDeliveryController.dispose();
  }

  void initState() {
    _dateTimeDeliveryController.addListener(_getDateDelivery);
  }

  _getDateDelivery() {
    return _dateTimeDeliveryController.text.toString();
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(children: <Widget>[
        // Text('Basic date & time field (${format.pattern})'),
        DateTimeField(
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Delivery Date/Time (${format.pattern})',
            hintText: "Select date and time",
            suffixIcon: const Icon(
              Icons.event,
              color: Color(0xff2E1C4C),
            ),
          ),
          format: format,
          onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.combine(date, time);
            } else {
              return currentValue;
            }
          },
          validator: (value) {
            if (value == null) {
              return "Delivery date is required";
            }
            return null;
          },
          onChanged: (value) {
            _dateDeliveryCreated = value.toString();
          },
        ),
      ]),
    );
  }
}
