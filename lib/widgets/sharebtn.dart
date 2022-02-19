import 'package:flutter/material.dart';
import 'package:fllutter_firabase_form/screens/share.dart';

// ignore: must_be_immutable
class ShareButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 1,
      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              "Share Your Food",
              style: TextStyle(
                fontSize: size.height * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                      width: size.width / 2,
                      child: _CirButton(
                          title: 'Cooked Food', imgurl: 'cooked_food')),
                ),
                Expanded(
                  child: Container(
                      width: size.width / 2,
                      child: _CirButton(
                          title: 'Uncooked Food', imgurl: 'uncooked_food')),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                      width: size.width * .44,
                      child: _CirButton(
                          title: 'Fruits & Vegies', imgurl: 'fruit_vegies')),
                ),
                Expanded(
                  child: Container(
                      width: size.width * .44,
                      child: _CirButton(
                          title: 'Other Things', imgurl: 'other_things')),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}

class _CirButton extends StatelessWidget {
  final String title;
  final String imgurl;
  const _CirButton({
    Key? key,
    required this.title,
    required this.imgurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SharePage()));
        },
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/' + imgurl + '.png'),
              radius: size.width * 0.1,
            ),
            Text(title)
          ],
        ));
  }
}
