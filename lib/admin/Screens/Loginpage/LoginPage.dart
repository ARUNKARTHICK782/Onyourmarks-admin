import 'package:flutter/material.dart';
import 'package:onyourmarks/admin/AdminHomePage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Loginpage extends StatelessWidget {
  Loginpage({Key? key}) : super(key: key);

  TextEditingController username1 = TextEditingController();

  TextEditingController password1 = TextEditingController();
  var username = "admin";
  var password = "admin";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SIH - 2022",
                  style: TextStyle(
                      color: Colors.indigo[50],
                      fontSize: 100,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Smart India Hackathon",
                  style: TextStyle(
                      color: Colors.indigo[50],
                      fontSize: 30,
                      fontWeight: FontWeight.normal),
                )
              ],
            )),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(188.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Text(
                      //   "LoginPage",
                      //   style: TextStyle(
                      //       color: Colors.indigo,
                      //       fontSize: 24,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      TextField(
                        controller: username1,
                        decoration: InputDecoration(labelText: "Username"),
                      ),
                      TextField(
                        controller: password1,
                        decoration: InputDecoration(labelText: "password"),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (username1.text == username &&
                                password1.text == password) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => adminHomePage()));
                            } else {
                              toast("invalid Username or Password");
                            }
                          },
                          child: Text("Login"))
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void toast(message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

getToAdmin() {}
