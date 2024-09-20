import 'package:flutter/material.dart';
import 'package:password_field_validator/password_field_validator.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  bool _validPassword = false;
  final TextEditingController pwdController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password Validated Field"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _validPassword
                ? Text(
                    "Password Valid!",
                    style: TextStyle(fontSize: 22.0),
                  )
                : Container(),
            PasswordFieldValidator(
              controller: pwdController,
            ), // password validated field from package

            // Button to validate the form
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _validPassword = true;
                    });
                  } else {
                    setState(() {
                      _validPassword = false;
                    });
                  }
                },
                child: Text("Check password!")),
          ],
        ),
      ),
    );
  }
}
