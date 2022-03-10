import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mon_projet/InStock/in_stock.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _buildHome(){
      return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Help
            Container(
              margin: const EdgeInsets.only(
                  top: 5,
                  right: 20,
                  bottom: 20
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                              'Help',
                              style: TextStyle(
                                  color: Color(0xff2E1C4C),
                                  fontWeight: FontWeight.w600),
                            ),
                            content: const Text(
                              "This page contains 03 options. To perform an action (save stock, save order or view stats), just tap on the appropriate option to proceed.",
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
                      )
                    },
                    child: const Text(
                      "Help for this page ",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff2E1C4C),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.info_outline,
                    size: 13,
                    color: Color(0xff2E1C4C),
                  )
                ],
              ),
            ),
            // Tile 1
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InStockPage()
                    )
                );
              },
              child: Container(
                height: 150,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: const Color(0xff978EA6),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/stock.svg",
                      // height: 100.0,
                    ),
                    const VerticalDivider(
                      color: Color(0xffCCCCCC),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Manage In-Stock",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff2E1C4C),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 3,),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Lorem Ipsum",
                            // "Hey, you just got another stock. Quickly register it now and let’s see how we can manage it and be the boss. Let’s Go!",
                            style: TextStyle(
                              // fontSize: 10
                                color: Colors.white
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            // Tile 2
            GestureDetector(
              onTap: () => {},
              child: Container(
                height: 150,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: const Color(0xff978EA6),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/order.svg",
                      height: 102.0,
                    ),
                    const VerticalDivider(
                      color: Color(0xffCCCCCC),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Manage Orders",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff2E1C4C),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 3,),
                        Text(
                          "Lorem Ipsum",
                          style: TextStyle(
                            // fontSize: 10
                              color: Colors.white
                          ),
                          textAlign: TextAlign.justify,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            // Tile 3
            GestureDetector(
              onTap: () => {},
              child: Container(
                height: 150,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: const Color(0xff978EA6),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/stats.svg",
                      height: 122.0,
                    ),
                    const VerticalDivider(
                      color: Color(0xffCCCCCC),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "View My Situation",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff2E1C4C),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 3,),
                        Text(
                          "Lorem Ipsum",
                          style: TextStyle(
                            // fontSize: 10
                              color: Colors.white
                          ),
                          textAlign: TextAlign.justify,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    final _kTabPages = <Widget>[
    //  The tabs' pages here
    //  TODO: Make sure to convert the Tabs' pages to functions to occupy les space.
    //  Page 1
      _buildHome(),
      //  Page 2
      const Center(
        child: Icon(
          Icons.bar_chart,
          size: 64.0,
          color: Color(0xff2E1C4C),
        ),
      ),
    //  Page 3
      const Center(
        child: Icon(
          Icons.forum,
          size: 64.0,
          color: Color(0xff2E1C4C),
        ),
      ),
    ];

    // The tabs
    final _kTabs = <Tab>[
      // Tab 1
      const Tab(
        icon: Icon(
          Icons.home_filled,
        ),
        text: "Home",
      ),
      // Tab 2
      const Tab(
        icon: Icon(
          Icons.bar_chart,
        ),
        text: "Statistics",
      ),
      // Tab 3
      const Tab(
        icon: Icon(
          Icons.forum,
        ),
        text: "Chat",
      ),
    ];


    return DefaultTabController(
        length: _kTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Howmacash",
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Autodestruct BB'
              ),
            ),
            backgroundColor: const Color(0xff2E1C4C),
            bottom: TabBar(
              tabs: _kTabs,
            ),
          ),
          body: TabBarView(
            children: _kTabPages,
          ),
        )
    );
  }
}
