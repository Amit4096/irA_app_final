import 'package:firebase_auth/firebase_auth.dart';
import 'package:fllutter_firabase_form/main.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'home.dart';

class PasswordScreen extends StatefulWidget {
  final String phone;
  final String uid;
  PasswordScreen(this.phone, this.uid);
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<PasswordScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String _selectedGender = 'male';
  @override
  Widget build(BuildContext context) {
    _phoneController.text = (widget.phone);
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Profile Setup'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: _nameController,
                maxLength: 15,
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: _passwordController,
                obscureText: true,
                maxLength: 15,
                decoration: InputDecoration(
                  hintText: 'Enter new Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: _passwordController1,
                obscureText: true,
                maxLength: 15,
                decoration: InputDecoration(
                  hintText: 'Re-Enter new Password',
                ),
              ),
            ),

            const Text('Please let us know your gender:'),
            ListTile(
              leading: Radio<String>(
                value: 'male',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
              ),
              title: const Text('Male'),
            ),
            ListTile(
              leading: Radio<String>(
                value: 'female',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
              ),
              title: const Text('Female'),
            ),
            const SizedBox(height: 15),

            // Text(_selectedGender == 'male' ? 'Hello gentlement!' : 'Hi lady!')

            // Padding(
            //   padding: const EdgeInsets.all(30.0),
            //   child: TextField(
            //     keyboardType: TextInputType.text,
            //     controller: _addressController,
            //     // maxLength: 15,
            //     decoration: InputDecoration(
            //       hintText: 'Enter Your Address',
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: _addressController,
                maxLength: 15,
                decoration: InputDecoration(
                  hintText: 'Enter Your Address',
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your age',
                prefix: Padding(
                  padding: EdgeInsets.all(4),
                ),
              ),
              maxLength: 10,
              keyboardType: TextInputType.number,
              controller: _ageController,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  if (_nameController.text.length <= 4) {
                    _scaffoldkey.currentState!.showSnackBar(SnackBar(
                        content:
                            Text('Password should be minimum 4 characters')));
                    return;
                  }
                  if (_passwordController.text.length <= 4) {
                    _scaffoldkey.currentState!.showSnackBar(SnackBar(
                        content:
                            Text('Password should be minimum 4 characters')));
                  }
                  if (_passwordController.text != _passwordController1.text) {
                    _scaffoldkey.currentState!.showSnackBar(
                        SnackBar(content: Text('Password should be same')));
                  }
                  Map userDetails = {
                    "mobile": widget.phone,
                    "password": _passwordController.text,
                    "name": _nameController.text,
                    "age": _ageController.text,
                    "gender": _selectedGender,
                    "address": _addressController.text,
                  };

                  dbRef.child(widget.uid).set(userDetails).then((value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Home(widget.uid, _nameController.text)),
                        (route) => false);
                  }).onError((error, stackTrace) {
                    _scaffoldkey.currentState!.showSnackBar(
                        SnackBar(content: Text('${error.toString()}')));
                  });
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
