import 'package:flutter/material.dart';

class DonatePage extends StatelessWidget {
  final String message =
      '''Thank you for your generous gift to irA. We are thrilled to have your support. Through your donation we have been able to accomplish our goal and continue working towards feeding the needy people. You truly make the difference for us, and we are extremely grateful!''';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Donate Money \$'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, size.width * 0.05),
                  child: Container(
                    child: Text(message,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        )),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.55,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(size.width * 0.1),
                  bottomRight: Radius.circular(size.width * 0.1),
                )),
            child: Column(
              children: [
                Image.asset(
                  'images/donate.png',
                  width: 250,
                  height: 250,
                ),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                          width: size.width * 0.4,
                          height: size.height * 0.08,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: InkWell(
                              child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Center(
                                      child: Image(
                                          image: AssetImage(
                                              'images/gpaylogo.png')))))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 20,
                          child: Text(
                            'OR',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                    ),
                    Expanded(
                      child: Container(
                          width: size.width * 0.4,
                          height: size.height * 0.08,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: InkWell(
                              child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Center(
                                      child: Image(
                                          image: AssetImage(
                                              'images/apaylogo.png')))))),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
