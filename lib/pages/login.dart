import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/registration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/background.png'), // Your background image asset
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Login'),
          ),
          backgroundColor: Colors.transparent,
          body: _page(),
        ),
      ],
    );
  }

  Widget _page() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon(),
          SizedBox(height: 20),
          _buildTextField("Enter Email", _usernameController),
          SizedBox(height: 20),
          _buildTextField("Password", _passwordController, isPassword: true),
          SizedBox(height: 25),
          _submit(),
          SizedBox(
            height: 15,
          ),
          Text("Don't have an account?"),
          SizedBox(
            height: 10,
          ),
          _reg(),
          SizedBox(
            height: 15,
          ),
          Text("-----------------OR------------------"),
          SizedBox(
            height: 10,
          ),
          _buttons(),
        ],
      ),
    );
  }

  Widget _submit() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Text("Login"),
          ),
          SizedBox(
            width: 30,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Forgot")),
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _buttons() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {}, child: Text("Google")),
          SizedBox(width: 50),
          ElevatedButton(onPressed: () {}, child: Text("Facebook")),
        ],
      ),
    );
  }

  Widget _reg() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegistrationPag()),
              );
            },
            child: Text("Registration Form"),
          ),
        ],
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(0, 254, 254, 254), width: 2),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.person,
        color: Color.fromARGB(255, 15, 8, 30),
        size: 120,
      ),
    );
  }

  Widget _buildTextField(String text, TextEditingController controller,
      {bool isPassword = false}) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(color: Color.fromARGB(255, 98, 229, 244)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }
}
