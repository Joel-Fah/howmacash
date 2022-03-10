import 'package:flutter/material.dart';

class InStockPage extends StatelessWidget {
  const InStockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "In-Stocks",
          style: TextStyle(
              fontFamily: 'Autodestruct BB'
          ),
        ),
        backgroundColor: const Color(0xff2E1C4C),
        actions: <Widget>[
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.sort
              )
          ),
          IconButton(
              onPressed: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    // false = user must tap button, true = tap outside dialog
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        title: const Text(
                          'Help',
                          style: TextStyle(
                          color: Color(0xff2E1C4C),
                          fontWeight: FontWeight.w600),
                        ),
                        content: const Text(
                          "Comming soon",
                          textAlign: TextAlign.justify,
                        ),
                        actions: <Widget>[
                        TextButton(
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                          },
                          ),
                        ],
                      );
                    },
                  );
              },
              icon: const Icon(
                  Icons.info_outline
              )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: IconButton(
          icon: const Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () => {},
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Items
              Container(
                margin: const EdgeInsets.only(top: 20, left: 5),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff2E1C4C),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )
                      ),
                      padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 20,
                          right: 10,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                    "Date Created",
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 12
                                  ),
                                ),
                                Text(
                                  "10/01/2022",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () => {},
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              )
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          color: Color(0xff978EA6),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "ID",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Name",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Amount",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Unit Price",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Total Price",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Date Ordered",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Status",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
