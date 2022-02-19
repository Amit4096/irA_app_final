import 'package:flutter/material.dart';
import 'package:fllutter_firabase_form/widgets/shareform.dart';

class SharePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Share Your Food / Item'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            children: [
              Container(
                width: (size.width <= 497.0
                    ? 200.0
                    : size.width <= 696.0
                        ? 200.0
                        : 300),
                child: Image.asset(
                  'images/form.png',
                ),
              ),
              ShareForm()
            ],
          )
        ],
      )),
    );
  }
}
