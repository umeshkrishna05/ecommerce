import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';

class IntroPage extends StatefulWidget {
  // Remove const keyword here
  IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _headingAnimation;
  late Animation<double> _subheadingOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _headingAnimation = Tween<double>(begin: 24, end: 48).animate(
      CurvedAnimation(
          parent: _controller,
          curve: Interval(0, 0.5, curve: Curves.easeInOut)),
    );

    _subheadingOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: Interval(0.5, 1.0, curve: Curves.easeInOut)),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png', // Add your logo asset path
                height: 120,
              ),
              SizedBox(height: 20),
              AnimatedBuilder(
                animation: _headingAnimation,
                builder: (context, child) {
                  return Text(
                    'Welcome to Mystore',
                    style: TextStyle(
                      fontSize: _headingAnimation.value,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              FadeTransition(
                opacity: _subheadingOpacityAnimation,
                child: Text(
                  'Your one-stop shop for all your needs',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40),
              _button(
                  context), // Invoke the _button method without const keyword
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
        child: Text(
          'Get Started',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
