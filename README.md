A package that lets you include a cool, nice looking and validated `Password TextFormField` in your app to enhance user experience. The package is **fully & easily modifiable**.

## Customizable Attributes

Import `package:password_field_validator/src/requirement_widget.dart` and following fields are modifiable:
- `inputDecoration`
- `textEditingController`
- `textInputAction`
- `onEditComplete`
- `onFieldSubmitted`
- `focusNode`
- `cursorColor`
- `textStyle`
- `activeIcon`
- `inActiveIcon`
- `activeRequirementColor`
- `inActiveRequirementColor`

## 👀 Here's how it looks
Below are few samples of what the package looks like.

**Import** the package and use `package:password_field_validator/password_field_validator.dart`

## 💻 Simple usage

<img src="https://user-images.githubusercontent.com/43790152/121000165-5683b180-c7a3-11eb-8a8f-5524dfa63291.gif" />

<br>
<br>

```dart
class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  // simple check
  bool _validPassword = false;

  // form key
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
            PasswordFieldValidator(), // password validated field from package
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
```

<br>
<br>

## Customized usage

<img src="https://user-images.githubusercontent.com/43790152/121000355-8e8af480-c7a3-11eb-8763-7ddf64fd48f2.gif" />

<br>
<br>

```dart
class CustomizeFieldExample extends StatefulWidget {
  const CustomizeFieldExample({Key? key}) : super(key: key);

  @override
  _CustomizeFieldExampleState createState() => _CustomizeFieldExampleState();
}

class _CustomizeFieldExampleState extends State<CustomizeFieldExample> {
  // simple check
  bool _validPassword = false;

  // form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customized Field"),
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
              inActiveIcon: Icons.cancel_outlined,
              activeIcon: Icons.check,
              inActiveRequirementColor: Colors.orange,
              activeRequirementColor: Colors.green,
            ), // password validated field from package
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
```

<br>
<br>

## More customized usage

<img src="https://user-images.githubusercontent.com/43790152/121000349-8cc13100-c7a3-11eb-865c-9b84c54f73a5.gif" />

<br>
<br>

```dart
class MoreCustomizedField extends StatefulWidget {
  const MoreCustomizedField({Key? key}) : super(key: key);

  @override
  _MoreCustomizedFieldState createState() => _MoreCustomizedFieldState();
}

class _MoreCustomizedFieldState extends State<MoreCustomizedField> {
  // simple check
  bool _validPassword = false;

  // form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customized Field"),
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
              inActiveIcon: Icons.cancel,
              activeIcon: Icons.done_all,
              inputDecoration: InputDecoration(
                labelText: "Enter password",
                filled: true,
                fillColor: Colors.grey[300],
                prefixIcon: Icon(Icons.lock),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ), // password validated filed from package
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
```

## 🛠 Modifying the package

You can easily modify the package according to your need.

Major attributes to look for:
- `RegExp` at the bottom of [validated_field](lib/src/validated_field.dart)
- `onChange` callBack in [validated_field](lib/src/validated_field.dart)
- `requirement_widget` in [requirement_widget](lib/src/requirement_widget.dart)
- `requirement_widget` checks added in [validated_field](lib/src/validated_field.dart)

### RegExp modification

- 1 Uppercase `RegExp(r'[A-Z]')`
- 1 lowercase `RegExp(r'[a-z]')`
- 1 numeric value `RegExp(r'[0-9]')`
- 1 special character `RegExp(r'[!@#$%^&*(),.?":{}|<>]')`
- 6 character length `_pass.length >= 6`

Combine `RegExp` that you would need to modify along with the above mentioned:

`RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')`

Complete Simple Example, [here.](example/example.dart)