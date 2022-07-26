// Define a custom Form widget.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final roll_noController = TextEditingController();
  final parent1nameController = TextEditingController();
  final parent2nameController = TextEditingController();
  final incomeController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final currentAddressController = TextEditingController();
  final permanentAddressController = TextEditingController();

  String? gender;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    roll_noController.dispose();
    parent1nameController.dispose();
    parent2nameController.dispose();
    incomeController.dispose();
    emailController.dispose();
    phoneNoController.dispose();
    currentAddressController.dispose();
    permanentAddressController.dispose();
    super.dispose();
  }

  // date picker init
  DateTime _date = DateTime(2020, 11, 17);

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1930, 1),
      lastDate: DateTime(2030, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details form'),
      ),
      drawer: UserAccountsDrawerHeader(
        accountEmail: Text('RSK@gmail.com'),
        accountName: Text('Rsk'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 1100,
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.purple[100],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(flex: 2, child: Text('Roll No: ')),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: 250,
                                child: TextFormField(
                                  controller: roll_noController,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter your roll_no',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 10, child: Text(''))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 2, child: Text('First Parent Name: ')),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: 250,
                                child: TextFormField(
                                  controller: parent1nameController,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter your parent1name',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 10, child: Text(''))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 2, child: Text('Second Parent Name: ')),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: 250,
                                child: TextFormField(
                                  controller: parent2nameController,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter your parent2name',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 10, child: Text(''))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 2, child: Text('income:')),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: 250,
                                child: TextFormField(
                                  controller: incomeController,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Enter your income',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 10, child: Text(''))
                          ],
                        ),
                        Row(children: [
                          Expanded(flex: 2, child: Text('email: ')),
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Enter your email',
                              ),
                            ),
                          ),
                          Expanded(flex: 10, child: Text(''))
                        ]),
                        Row(
                          children: [
                            Expanded(flex: 2, child: Text(' PhoneNo: ')),
                            SizedBox(
                              width: 250,
                              child: TextFormField(
                                controller: phoneNoController,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Enter your phoneNo',
                                ),
                              ),
                            ),
                            Expanded(flex: 10, child: Text(''))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 2, child: Text('CurrentAddress: ')),
                            SizedBox(
                              width: 250,
                              child: TextFormField(
                                controller: currentAddressController,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Enter your currentAddress',
                                ),
                              ),
                            ),
                            Expanded(flex: 10, child: Text(''))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 2, child: Text('permanentAddress: ')),
                            SizedBox(
                              width: 250,
                              child: TextFormField(
                                controller: permanentAddressController,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Enter your permanentAddress',
                                ),
                              ),
                            ),
                            Expanded(flex: 10, child: Text(''))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 2, child: Text('motherTongue:  ')),
                            SizedBox(width: 250,
                              child: TextFormField(
                                controller: null,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Enter your motherTongue',
                                ),
                              ),
                            ),
                            Expanded(flex: 10, child: Text(''))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 2, child: Text('bloodGroup: ')),
                            SizedBox(width: 250,
                              child: TextFormField(
                                controller: null,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Enter your bloodGroup',
                                ),
                              ),
                            ),
                            Expanded(flex: 10, child: Text(''))
                          ],
                        ),
                        const Text(
                          "What is your gender?",
                          style: TextStyle(fontSize: 18),
                        ),
                        Divider(),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListTile(
                                title: Text("Male"),
                                leading: Radio(
                                    value: "male",
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value.toString();
                                      });
                                    }),
                              ),

                              ListTile(
                                title: Text("Female"),
                                leading: Radio(
                                    value: "female",
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value.toString();
                                      });
                                    }),
                              ),
                              ListTile(
                                title: Text("Other"),
                                leading: Radio(
                                    value: "other",
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value.toString();
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          children: [
                            Expanded(flex: 2, child: Text('SELECT DOB: ')),
                            Expanded(
                              flex: 5,
                              child: ElevatedButton(
                                onPressed: _selectDate,
                                child: Text('SELECT DATE OF BIRTH'),
                              ),
                            ),
                            Expanded(flex: 5, child: Text('')),
                            SizedBox(height: 8),
                            Text(
                              'Selected DOB: $_date',
                            ),
                          ],
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}