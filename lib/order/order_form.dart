import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../date_time.dart';
import '../success_pages/success_instock.dart';

class AddOrderPage extends StatefulWidget {
  const AddOrderPage({Key? key}) : super(key: key);

  @override
  State<AddOrderPage> createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  @override
  Widget build(BuildContext context) {
    // Form variables
    String? _name;
    String? _city;
    String? _phone;
    String? _amount;
    String? _unitPrice;
    String? _total;
    String? _dateOrdered;
    String? _dateDelivery;
    String? _addInfo;
    String? _completed;


    String sizePattern = r"^[0-9]*$";
    String phonePattern = r"^(?=.{9}$)((6|2).*$)";

    // Form Widgets
    final GlobalKey<FormState> _addOrderFormKey = GlobalKey<FormState>();

    Widget _buildName() {
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
              labelText: "City/Quarter",
              hintText: "Customer Location",
              hintStyle: TextStyle(
                color: Color(0xff707070),
                fontSize: 15,
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none),
          onSaved: (value) {
            if (value == null || value.isEmpty) {
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
          onSaved: (value) {
            _unitPrice = value;
          },
        ),
      );
    }

    Widget _buildTotal() {
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
              labelText: "Total",
              hintText: "Total",
              hintStyle: TextStyle(
                color: Color(0xff707070),
                fontSize: 15,
              ),
              suffixText: "XAF",
              suffixStyle: TextStyle(color: Colors.green),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none),
          onSaved: (value) {
            _total = value;
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
          onSaved: (value) {
            if (value == null || value.isEmpty) {
              _addInfo = "N/A";
            }
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
                      isAlwaysShown: true,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Form(
                              key: _addOrderFormKey,
                              child: Column(
                                children: [
                                  _buildName(),
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
                                          borderRadius: BorderRadius.circular(10.0)
                                        ),
                                        padding: const EdgeInsets.all(10.0),
                                      ),
                                      onPressed: () {
                                          if (_addOrderFormKey.currentState!.validate()) {
                                            debugPrint("All validations passed!");
                                            //  Go to the next page...
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => const SuccessPageInStock()
                                                )
                                            );
                                          }else{
                                            debugPrint("Some validations failed... Checkout!");
                                          }
                                          _addOrderFormKey.currentState!.save();
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "Save Order",
                                            style: TextStyle(
                                                fontSize: 18
                                            ),
                                          ),
                                          SizedBox(width: 10.0,),
                                          Icon(
                                              Icons.save
                                          )
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
        ));
  }
}
