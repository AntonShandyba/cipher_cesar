import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'logic.dart';

Logic logic = Logic();
String result = '';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      result = '';
    });
  }

  inputFormattion() {
    return <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
    ];
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'CAESAR CIPHER',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            Form(
              key: formKey,
              child: Column(children: [
                const Text('Cipher app for NURE',style: TextStyle(fontSize: 20.0)),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                    left: MediaQuery.of(context).size.height * 0.02,
                    right: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: TextFormField(
                    cursorColor: Colors.orange.shade900,
                    controller: input,
                    inputFormatters: inputFormattion(),
                    validator: (value) {
                      if (value!.isEmpty) return 'Required';
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange.shade900),
                        borderRadius: BorderRadius.circular(18.0)
                      ),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(18.0))),
                        hintText: 'Input'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: Container(
                          child: Text(
                            'ENCRYPT',
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.orange.shade900),
                        ),
                        onTap: () {
                          if (formKey.currentState!.validate())
                            setState(() {
                              result = logic.caesar(input.text, 1);
                            });
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          child: Text(
                            'DECRYPT',
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.orange.shade900),
                        ),
                        onTap: () {
                          if (formKey.currentState!.validate())
                            setState(() {
                              result = logic.caesar(input.text, 0);
                            });
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: ListTile(
                      title: Text(
                    'OUTPUT',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: ListTile(
                      title: Text(
                    result,
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  )),
                ),
              ]),
            )
          ],
        ));
  }
}
