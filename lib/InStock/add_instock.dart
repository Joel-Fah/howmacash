import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../date_time.dart';
import '../success.dart';

class AddInStockPage extends StatefulWidget {
  const AddInStockPage({Key? key}) : super(key: key);

  @override
  State<AddInStockPage> createState() => _AddInStockPageState();
}

class _AddInStockPageState extends State<AddInStockPage> {
  @override
  Widget build(BuildContext context) {
    // Form variables
    String? _productName;
    String? _authorName;
    String? _edition;
    String? _amount;
    String? _unitPrice;
    String? _addInfo;

    String sizePattern = r"^[0-9]*$";

    // Form Widgets
    final GlobalKey<FormState> _addInStockFormKey = GlobalKey<FormState>();

    Widget _buildProductName() {
      return Container(
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
          top: 15,
        ),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: TextFormField(
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
          onSaved: (value) {
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
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Color(0xffEEEEEE))
            ]),
        alignment: Alignment.center,
        margin: const EdgeInsets.only(
          top: 15,
        ),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: TextFormField(
          enableSuggestions: true,
          decoration: const InputDecoration(
              labelText: "Author",
              hintText: "Author name",
              hintStyle: TextStyle(
                color: Color(0xff707070),
                fontSize: 15,
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Author name is required.";
            }

            return null;
          },
          onSaved: (value) {
            _authorName = value;
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
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Color(0xffEEEEEE))
            ]),
        alignment: Alignment.center,
        margin: const EdgeInsets.only(
          top: 15,
        ),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: TextFormField(
          enableSuggestions: true,
          decoration: const InputDecoration(
              labelText: "Edition",
              hintText: "Month Year (Ex. Jan 2022)",
              hintStyle: TextStyle(
                color: Color(0xff707070),
                fontSize: 15,
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none),
          validator: (value) {
            if (value == null || value.isEmpty) {
              _edition = "N/A";
            }

            return null;
          },
          onSaved: (value) {
            _productName = value;
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
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Color(0xffEEEEEE))
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
          decoration: const InputDecoration(
              labelText: "Amount Printed",
              hintText: "1, 2, 3 or more?",
              hintStyle: TextStyle(
                color: Color(0xff707070),
                fontSize: 15,
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none
          ),
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
          onSaved: (value) {
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
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Color(0xffEEEEEE))
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
              errorBorder: InputBorder.none
          ),
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
          onSaved: (value) {
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              // return "Bio is required.";
              value = "N/A";
            }

            return null;
          },
          onSaved: (value) {
            _addInfo = value;
          },
        ),
      );
    }

    return Scaffold(
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
                            style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          )),
                      Text(
                        "STOCK 0025",
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
                        color: Color(0xff2E1C4C)
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "Give this new stock an identity. We recommend that you pay attention when filling the form.",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 400.0,
                    child: Scrollbar(
                      isAlwaysShown: true,
                      child: SingleChildScrollView(
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
                                  Container(
                                    height: 54,
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              offset: Offset(0, 10),
                                              blurRadius: 50,
                                              color: Color(0xffEEEEEE))
                                        ],
                                        color: const Color(0xff2E1C4C),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: TextButton(
                                        onPressed: () {
                                          if (_addInStockFormKey.currentState!.validate()) {
                                            debugPrint("All validations passed!");
                                            //  Go to the next page...
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => const SuccessPage()
                                                )
                                            );
                                          }else{
                                            debugPrint("Some validations failed... Checkout!");
                                          }
                                          _addInStockFormKey.currentState!.save();
                                        },
                                        child: const Text(
                                          "Add In-stock",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        )
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
                  const SizedBox(height: 10,),
                //  TODO: Add a DraggableScrollableScrollView to enable user see recent/last stocks saved.
                ],
              ),
            ),
          ),
        )
    );
  }
}
