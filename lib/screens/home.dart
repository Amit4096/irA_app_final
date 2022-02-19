import 'package:flutter/material.dart';
import 'package:fllutter_firabase_form/screens/history.dart';
import 'package:fllutter_firabase_form/widgets/imgs.dart';
import 'package:fllutter_firabase_form/widgets/menu.dart';
import 'package:fllutter_firabase_form/widgets/sharebtn.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('irA'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.qr_code_scanner,
              size: 30,
            ),
            tooltip: 'Open Last Food Details',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HistoryPage()));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: size.height * 0.30,
                  child: ScrollImages(),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                ShareButtons(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: MenuButton(),
    );
  }
}
