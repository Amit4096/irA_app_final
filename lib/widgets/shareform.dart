import 'package:flutter/material.dart';
import 'package:fllutter_firabase_form/screens/thank.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class ShareForm extends StatefulWidget {
  const ShareForm({Key? key}) : super(key: key);
  @override
  _ShareFormState createState() => _ShareFormState();
}

class _ShareFormState extends State<ShareForm> {
  final _formKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd HH:mm");
  int? _foodtype = 1;
  int? _foodlevel = 0;
  String _foodname = '';
  String _foodplace = '';
  DateTime? _fooddatetime;

  Widget _foodName(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: 900,
      child: Padding(
        padding:
            EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.05),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Item Name';
            } else {
              _foodname = value;
            }
            return null;
          },
          decoration: InputDecoration(
              labelText: 'Enter Name of Item',
              icon: Icon(
                Icons.food_bank_rounded,
              )),
        ),
      ),
    );
  }

  Widget _foodPlace(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: 900,
      child: Padding(
        padding:
            EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.05),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Place of Item';
            } else {
              _foodplace = value;
            }
            return null;
          },
          decoration: InputDecoration(
              labelText: 'Enter Item Place',
              icon: Icon(
                Icons.place_outlined,
              )),
        ),
      ),
    );
  }

  Widget _foodDateTime(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 900,
      child: Padding(
        padding:
            EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.05),
        child: DateTimeField(
          decoration: InputDecoration(
              labelText: 'Enter Duration of Item is with You',
              icon: Icon(Icons.timelapse_outlined)),
          validator: (value) {
            if (value == null) {
              return 'Please Enter Duration';
            }
            return null;
          },
          format: format,
          onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.combine(date, time);
            } else {
              return currentValue;
            }
          },
          onChanged: (value) {
            _fooddatetime = value;
          },
        ),
      ),
    );
  }

  Widget _foodTye(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 900,
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.05, right: size.width * 0.05),
          child: Column(
            children: [
              Text(
                'Choose The State of Item',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Row(children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[500],
                    ),
                    Radio(
                      value: 1,
                      groupValue: _foodtype,
                      onChanged: (val) {
                        setState(() {
                          _foodtype = val as int;
                        });
                      },
                    ),
                    SizedBox(width: 10.0),
                    Text('Solid / Firm'),
                  ]),
                  SizedBox(width: 30),
                  Row(children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[500],
                    ),
                    Radio(
                      value: 2,
                      groupValue: _foodtype,
                      onChanged: (val) {
                        setState(() {
                          _foodtype = val as int;
                        });
                      },
                    ),
                    SizedBox(width: 10.0),
                    Text('Liquid / Fluid'),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _foodLevel(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 900,
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.05, right: size.width * 0.05),
          child: Column(
            children: [
              Text(
                'Choose The Quantity of Item ',
                style: TextStyle(fontSize: 17, color: Colors.grey[700]),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.arrow_forward_ios, color: Colors.grey[500]),
                  SizedBox(width: 10),
                  ToggleSwitch(
                    totalSwitches: 3,
                    labels: ['Small', 'Medium', 'Large'],
                    cornerRadius: 30,
                    onToggle: (index) {
                      _foodlevel = index;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shareButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing Data')),
            );
            print(_foodname);
            print(_foodplace);
            print(_fooddatetime);
            print(_foodtype);
            print(_foodlevel);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThankYouPage()),
            );
          }
        },
        child: const Text(
          'Share Food / Item',
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _foodName(context),
            SizedBox(height: 15),
            _foodPlace(context),
            SizedBox(height: 15),
            _foodDateTime(context),
            SizedBox(height: 15),
            _foodTye(context),
            SizedBox(height: 15),
            _foodLevel(context),
            SizedBox(height: 15),
            _shareButton(context),
          ],
        ));
  }
}
