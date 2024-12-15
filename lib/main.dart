import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.cyan, useMaterial3: true),
        home: const MyStatefullWidget());
  }
}

class MyStatefullWidget extends StatefulWidget {
  const MyStatefullWidget({super.key});

  @override
  State<MyStatefullWidget> createState() => _MyStatefullWidgetState();
}

class _MyStatefullWidgetState extends State<MyStatefullWidget> {
  final _formKey = GlobalKey<FormState>();
  var imagePath =
      "https://images.pexels.com/photos/1666012/pexels-photo-1666012.jpeg?auto=compress&cs=tinysrgb&w=600";
  void _formStateCounter() {
    _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return SafeArea(
        child: Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(40, 80, 0, 0)),
                  const Text(
                    "Welcome back",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  const Text(
                    "Login to manage your account.",
                    style: TextStyle(color: Colors.black54, fontSize: 10),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                              width: 200,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    return null;
                                  } else {
                                    return "this field must be filled";
                                  }
                                },
                                autofocus: true,
                                decoration: const InputDecoration(
                                    labelText: "User Name",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 10))),
                              )),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          SizedBox(
                              width: 200,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    labelText: "Email",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 10))),
                              )),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          SizedBox(
                              width: 200,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.length >= 8) {
                                    return null;
                                  } else {
                                    return "minimum length should be 8";
                                  }
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                    labelText: "Password",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 10))),
                              )),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          SizedBox(
                              width: 200,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    labelText: "Phone",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 10))),
                                validator: (value) {
                                  if (value!.isNotEmpty && value.length == 11) {
                                    return null;
                                  } else {
                                    return "inValid Phone No";
                                  }
                                },
                              )),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          SizedBox(
                              width: 200,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    labelText: "CNIC",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 10))),
                              )),
                        ],
                      )),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  SizedBox(
                      width: 100,
                      child: ElevatedButton(
                          onPressed: _formStateCounter,
                          child: const Text("Login")))
                ],
              )),
          Expanded(
              flex: 50,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: width * 0.5,
                        height: height * 1.0,
                        child: Image.network(
                          imagePath,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              width: width * 0.3,
                              height: height * 1.0,
                              alignment: Alignment.bottomLeft,
                              child: const Text(
                                "Start your journey with us",
                                style: TextStyle(
                                    fontSize: 60,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
