
//import 'package:apitest/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:hexcolor/hexcolor.dart';
import '../common/theme_helper.dart';
import 'common/header_widget.dart';
//import 'profile_page.dart';
//import 'widgets/header_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistrationPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController employeeIDController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var checkboxValue;

  var _formKey;
  Future<void> registerUser() async {
    // Get the values entered by the user
    final name = nameController.text;
    final email = emailController.text;
    final contact = contactController.text;
    final employeeID = employeeIDController.text;
    final cnic = cnicController.text;
    final password = passwordController.text;

    // Prepare the data to be sent in the request body
    final Map<String, String> data = {
      "name": name,
      "email": email,
      "contact": contact,
      "employeeID": employeeID,
      "cnic": cnic,
      "password": password,

           // "name": "Salman1",
           // "email": "salman1@gmail.com",
           // "contact": "2345678",
           // "employeeID": "121",
           // "cnic": "425678543",
           // "password": "abc123"
    };

    // Convert the data to a JSON string using jsonEncode
    final String jsonData = jsonEncode(data);

    // Set the headers
    final Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
    };

    // Make the API request
    final url = Uri.parse('https://aa00-154-198-115-32.ngrok-free.app/passengersignup'); // Replace with the actual API endpoint URL
    final response = await http.post(url, headers: headers, body: jsonData);

    if (response.statusCode == 200) {
      // Successful registration
      // You can handle the response here, such as displaying a success message
      print('Registration successful');
      Map<String, dynamic> responseData = jsonDecode(response.body);
      Map<String, dynamic> responseObject = responseData["object"];
      print('Response body: ${response.body}');
      print('Response Message: ${responseData["message"]}');
      print('Response Email: ${responseObject["Email"]}');
    } else {
      // Failed registration
      print('Registration failed with status: ${response.statusCode}');

      // Print response body for debugging
      print('Response body: ${response.body}');
    }
  }

//   curl -X 'POST' \
//   'https://a78c-154-198-115-193.ngrok-free.app/passengersignup' \
//   -H 'accept: application/json' \
//   -H 'Content-Type: application/json' \
//   -d '{
//   "name": "string",
//   "email": "string",
//   "contact": "string",
//   "employeeID": "string",
//   "cnic": "string",
//   "password": "string"
// }'


  // Future<void> registerUser() async {
  //   // Get the values entered by the user
  //   final name = nameController.text;
  //   final email = emailController.text;
  //   final contact = contactController.text;
  //   final employeeID = employeeIDController.text;
  //   final cnic = cnicController.text;
  //   final password = passwordController.text;
  //
  //   // Make the API request
  //   final url = Uri.parse('https://e7a6-110-38-244-134.ngrok-free.app/signup'); // Replace with the actual API endpoint URL
  //   final response = await http.post(url, body: {
  //     "Content-Type":"application/json",
  //     // 'name': name,
  //     // 'userType': userType,
  //     // 'orgId': orgId,
  //     // 'email': email,
  //     // 'password': password,
  //
  //     "name": name,
  //     "email": email,
  //     "contact": contact,
  //     "employeeID": employeeID,
  //     "cnic": cnic,
  //     "password": password
  //
  //     // "name": "Salman1",
  //     // "email": "salman1@gmail.com",
  //     // "contact": "2345678",
  //     // "employeeID": "121",
  //     // "cnic": "425678543",
  //     // "password": "abc123"
  //   });
  //
  //   if (response.statusCode == 200) {
  //     // Successful registration
  //     // You can handle the response here, such as displaying a success message
  //     print('Registration successful');
  //   } else {
  //     // Failed registration
  //     print('Registration failed with status: ${response.statusCode}');
  //
  //     // Print response body for debugging
  //     print('Response body: ${response.body}');
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    width: 5,
                                    color: Colors.white,
                                  ),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          child: TextFormField(
                            controller: nameController,
                            decoration: ThemeHelper()
                                .textInputDecoration('Name', 'Enter your name'),
                          ),
                          decoration: ThemeHelper()
                              .inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: emailController,
                            decoration: ThemeHelper().textInputDecoration(
                              'E-mail address',
                              'Enter your email',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(
                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
                                  ).hasMatch(val)) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper()
                              .inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 30),
                        Container(
                          child: TextFormField(
                            controller: contactController,
                            decoration: ThemeHelper().textInputDecoration(
                                'Contact', 'Enter contact number'),
                          ),
                          decoration: ThemeHelper()
                              .inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: employeeIDController,
                            decoration: ThemeHelper().textInputDecoration(
                                'Employee ID', 'Enter your employee ID'),
                          ),
                          decoration: ThemeHelper()
                              .inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: cnicController,
                            decoration: ThemeHelper().textInputDecoration(
                                'CNIC', 'Enter your CNIC'),
                          ),
                          decoration: ThemeHelper()
                              .inputBoxDecorationShaddow(),
                        ),

                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                              'Password*',
                              'Enter your password',
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper()
                              .inputBoxDecorationShaddow(),
                        ),
                        // SizedBox(height: 15.0),
                        // Container(
                        //   child: TextFormField(
                        //     obscureText: true,
                        //     decoration: ThemeHelper().textInputDecoration(
                        //       'Re-Enter Password*',
                        //       'Re-Enter Password',
                        //     ),
                        //     validator: (val) {
                        //       if (val!.isEmpty) {
                        //         return 'Please enter your password';
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        //   decoration: ThemeHelper()
                        //       .inputBoxDecorationShaddow(),
                        // ),
                        //SizedBox(height: 15.0),
                        // FormField<bool>(
                        //   builder: (state) {
                        //     return Column(
                        //       children: <Widget>[
                        //         Row(
                        //           children: <Widget>[
                        //             Checkbox(
                        //               value: checkboxValue,
                        //               onChanged: (value) {
                        //                 setState(() {
                        //                   checkboxValue = value!;
                        //                   state.didChange(value);
                        //                 });
                        //               },
                        //             ),
                        //             Text(
                        //               'I accept all terms and conditions.',
                        //               style: TextStyle(color: Colors.grey),
                        //             ),
                        //           ],
                        //         ),
                        //         Container(
                        //           alignment: Alignment.centerLeft,
                        //           child: Text(
                        //             state.errorText ?? '',
                        //             textAlign: TextAlign.left,
                        //             style: TextStyle(
                        //               color: Theme.of(context).errorColor,
                        //               fontSize: 12,
                        //             ),
                        //           ),
                        //         )
                        //       ],
                        //     );
                        //   },
                        //   validator: (value) {
                        //     if (!checkboxValue) {
                        //       return 'You need to accept terms and conditions';
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper()
                              .buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            onPressed: registerUser,
                            // Call the registerUser function when the button is pressed
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                'Register'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
