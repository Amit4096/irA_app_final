import 'package:flutter/material.dart';

String phoneNo = " ";

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // late String phoneNo = " ";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _Banner(),
                _PhoneNum(),
                _VerifyBtn(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.1),
            child: Text(
              'irA',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image.asset(
            "images/login.png",
            width: size.width * 0.6,
            height: size.height * 0.4,
          )
        ],
      ),
    );
  }
}

class _PhoneNum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          size.width * 0.2, 0.0, size.width * 0.2, size.height * 0.07),
      child: SizedBox(
        width: 300,
        child: TextField(
          maxLength: 10,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            ),
            labelText: 'Enter Phone Number',
          ),
          onChanged: (value) {
            phoneNo = '+91$value';
          },
        ),
      ),
    );
  }
}

class _VerifyBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          size.width * 0.2, 0.0, size.width * 0.2, size.height * 0.05),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Verify'),
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple,
          onPrimary: Colors.white,
          onSurface: Colors.grey,
        ),
      ),
    );
  }
}
