import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

// import '../date_time.dart';
import '../success_pages/success_instock.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class PrintedDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  static String? _dateCreated;
  final TextEditingController _dateTimeController = TextEditingController();

  void dispose(){
    _dateTimeController.dispose();
  }

  void initState(){
    _dateTimeController.addListener(_getDateCreated);
  }

  _getDateCreated() {
    return _dateTimeController.text.toString();
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
          controller: _dateTimeController,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Date/Time printed (${format.pattern})',
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
              return "Printed date is required";
            }
            return null;
          },
          onChanged: (value) {
            _dateCreated = value.toString();
          },
        ),
      ]),
    );
  }
}

class AddInStockPage extends StatefulWidget {
  const AddInStockPage({Key? key}) : super(key: key);

  @override
  State<AddInStockPage> createState() => _AddInStockPageState();
}

class _AddInStockPageState extends State<AddInStockPage> {
// Form variables
  int? id;
  String? _productName;
  String? _authorName;
  String? _edition;
  String? _amount;
  String? _unitPrice;
  String? _addInfo;

  String sizePattern = r"^[0-9]*$";

  // controller for each form field
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _editionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _additionalInfoController = TextEditingController();

  // Dispose controllers
  @override
  void dispose() {
    _productNameController.dispose();
    _authorController.dispose();
    _editionController.dispose();
    _amountController.dispose();
    _unitPriceController.dispose();
    _additionalInfoController.dispose();
    // PrintedDateTimeField._dateTimeController.dispose();
    super.dispose();
  }

  // Get field names in String form
  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    _productNameController.addListener(_getProductName);
    _authorController.addListener(_getAuthorName);
    _editionController.addListener(_getEdition);
    _amountController.addListener(_getAmount);
    _additionalInfoController.addListener(_getAdditionalInfo);
    _unitPriceController.addListener(_getUnitPrice);
    // PrintedDateTimeField._dateTimeController.addListener(_getDateCreated);
  }

  // _getDateCreated() {
  //   return PrintedDateTimeField._dateTimeController.text.toString();
  // }

  _getProductName() {
    return _productNameController.text.toString();
  }

  _getAuthorName() {
    return _authorController.text.toString();
  }

  _getEdition() {
    return _editionController.text.toString();
  }

  _getAmount() {
    return _amountController.text.toString();
  }

  _getAdditionalInfo() {
    return _additionalInfoController.text.toString();
  }

  _getUnitPrice() {
    return _unitPriceController.text.toString();
  }

  // Build form fields
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
        top: 15,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: _productNameController,
        enableSuggestions: true,
        decoration: const InputDecoration(
            labelText: "Product Name",
            hintText: "Enter product name",
            hintStyle: TextStyle(
              color: Color(0xff707070),
              fontSize: 15,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Product name is required.";
          }

          return null;
        },
        onChanged: (value) {
          _productName = value;
        },
      ),
    );
  }

  Widget _buildAuthor() {
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
        controller: _authorController,
        enableSuggestions: true,
        decoration: const InputDecoration(
            labelText: "Author (optional)",
            hintText: "Author name",
            hintStyle: TextStyle(
              color: Color(0xff707070),
              fontSize: 15,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none),
        onChanged: (value) {
          _authorName = value;
          if (value.isEmpty) {
            _authorName = "N/A";
          }
        },
      ),
    );
  }

  Widget _buildEdition() {
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
        controller: _editionController,
        enableSuggestions: true,
        decoration: const InputDecoration(
            labelText: "Edition (optional)",
            hintText: "Month Year (Ex. Jan 2022)",
            hintStyle: TextStyle(
              color: Color(0xff707070),
              fontSize: 15,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none),
        onChanged: (value) {
          if (value.isEmpty) {
            _edition = "N/A";
          } else {
            _edition = value;
          }
        },
      ),
    );
  }

  Widget _buildDatePrinted() {
    return PrintedDateTimeField();
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
        enableSuggestions: true,
        controller: _amountController,
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
            return "Required";
          }
          // if (value as int < 0){
          //   return "Cannot be negative";
          // }

          // RegExp regex = RegExp(sizePattern);
          // if (!regex.hasMatch(value)) {
          //   return "Enter a valid number";
          // }

          return null;
        },
        onChanged: (value) {
          _amount = value;
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
        controller: _unitPriceController,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        keyboardType: TextInputType.number,
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
            return "Required";
          }
          // if (value as int < 0){
          //   return "Cannot be negative";
          // }

          // RegExp regex = RegExp(sizePattern);
          // if (!regex.hasMatch(value)) {
          //   return "Enter a valid number";
          // }

          return null;
        },
        onChanged: (value) {
          _unitPrice = value;
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
        enableSuggestions: true,
        decoration: const InputDecoration(
          labelText: "Additional Info",
          hintText: "Anything to add about this stock?",
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
          if (value.isEmpty) {
            _addInfo = "N/A";
          }else{
            _addInfo = value;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();

    // Form Widgets
    final GlobalKey<FormState> _addInStockFormKey = GlobalKey<FormState>();

    return GestureDetector(
      // Remove focus on any TextFormField when tapping anywhere on the screen
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
                      "assets/images/stock.svg",
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
                          "Current Stock ID",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                        Text(
                          "STOCK0025",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      "In-stock Credentials (Form)",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2E1C4C)),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Give this new stock an identity. We recommend that you pay attention when filling the form.",
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
                                key: _addInStockFormKey,
                                child: Column(
                                  children: [
                                    _buildProductName(),
                                    _buildAuthor(),
                                    _buildEdition(),
                                    _buildDatePrinted(),
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
                                          if (_addInStockFormKey.currentState!
                                              .validate()) {
                                            if (_productName != null) {
                                              debugPrint("Product name: " +
                                                  _productName!);
                                            } else {
                                              debugPrint(
                                                  "No product name found!");
                                            }
                                            if (_authorName != null) {
                                              debugPrint("Author name: " +
                                                  _authorName!);
                                            } else {
                                              debugPrint(
                                                  "No author name found!");
                                            }
                                            if (_edition != null) {
                                              debugPrint(
                                                  "Edition: " + _edition!);
                                            } else {
                                              debugPrint("No edition found!");
                                            }
                                            if (PrintedDateTimeField
                                                    ._dateCreated !=
                                                null) {
                                              debugPrint("Date created: " +
                                                  PrintedDateTimeField
                                                      ._dateCreated!);
                                            } else {
                                              debugPrint("No Date found!");
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
                                            if (_addInfo != null) {
                                              debugPrint("Additional Info: " +
                                                  _addInfo!);
                                            } else {
                                              debugPrint(
                                                  "No Additional Info found!");
                                            }

                                            //  Go to the next page (HomePage for now)...
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const SuccessPageInStock(),
                                              ),
                                            );
                                          } else {
                                            debugPrint(
                                                "Some validations failed... Checkout!");
                                          }
                                          _addInStockFormKey.currentState!
                                              .save();
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "Save In-Stock",
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
