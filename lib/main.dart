import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('LayoutBuilder Example')),
        body: LayoutBuilder(builder: (context, dimensions) {
          final width = dimensions.maxWidth / 1.5;
          final height = dimensions.maxHeight / 3;
          return Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: width,
                    minHeight: height,
                  ),
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.all(40.0),
                    // margin:  const EdgeInsets.only(top:20,right:50,bottom:20,left:50),
                    margin: const EdgeInsets.all(200),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 198, 217, 224),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: LoginForm(),
                  )),
            ),
          );
        }));
  }

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('LayoutBuilder Example')),
        body: LayoutBuilder(builder: (context, dimensions) {
          
          return Center(
            child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 200,
                    minHeight: 300,
                    maxWidth: 200,
                    maxHeight: 300,
                  ),
                  child: Container(
                    //height:100,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 198, 217, 224),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    //child: LoginForm(),
                  )));
        }));
  }
*/

  String? _validateEmail(String? value) {
    if (value?.isEmpty ?? false) {
      return "Field cannot be empty";
    } else
      return null;
  }

  String? _validatePassword(String? value) {
    if ((value?.length ?? 0) < 8) {
      return "At least 8 chars!";
    } else {
      return null;
    }
  }
}

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _key = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwController = TextEditingController();

  static const maxLength = 20;

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    emailController.addListener(_changeLabel);
  }

  void _changeLabel() {
    setState(() {
      emailController.text;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // Email
          TextFormField(
            controller: emailController,
            maxLength: maxLength,
            decoration: InputDecoration(
              icon: const Icon(Icons.mail),
              hintText: "Email",
              counterText: "Caratteri rimasti: "
                  "${maxLength - emailController.text.length}",
            ),
            validator: _validateEmail,
          ),
          TextFormField(
            decoration: const InputDecoration(
                icon: Icon(Icons.vpn_key), hintText: "Password"),
            controller: passwController,
            obscureText: true,
            validator: _validatePassword,
          ),
          const SizedBox(height: 20),
          // Login
          ElevatedButton(
            onPressed: _login,
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value?.isEmpty ?? false) {
      return "Field cannot be empty";
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if ((value?.length ?? 0) < 8) {
      return "At least 8 chars!";
    } else {
      return null;
    }
  }

  void _login() {
    if (_key.currentState?.validate() ?? false) {
      final email = emailController.text;
      final passw = passwController.text;
      final login = LoginClass(
        user: email,
        password: passw,
      );
      debugPrint("user: ${login.user}, psw: ${login.password}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("user: ${login.user}, psw: ${login.password}"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Errore"),
      ));
    }
  }
}

class LoginClass {
  final String user;
  final String password;

  LoginClass({required this.user, required this.password});
}
