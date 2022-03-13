import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddInStockPage extends StatelessWidget {
  const AddInStockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Form variables
    String? _productName;

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
              labelText: "Product Name",
              hintText: "Enter product name",
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
              return "Product name is required.";
            }

            return null;
          },
          onSaved: (value){
            _productName = value;
          },
        ),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "In-Stocks",
          style: TextStyle(
              fontFamily: 'Autodestruct BB'
          ),
        ),
        backgroundColor: const Color(0xff2E1C4C),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/stock.svg",
                  height: 150,
                ),
                const SizedBox(height: 20,),
                const Text(
                  "Let’s feed your virtual store with some new items. We recommend that you pay attention.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        "Current Stock ID: "
                      ),
                    ),
                    Text(
                        "STOCK0025",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              //  Form Items
                Column(
                  children: [
                    ListView(
                      shrinkWrap: true,
                      children: [
                        Form(
                          key: _addInStockFormKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // _buildProductName()
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
