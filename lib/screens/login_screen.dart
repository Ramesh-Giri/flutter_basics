import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_workshop/screens/home_screen.dart';
import 'package:flutter_workshop/services/auth_service.dart';
import 'package:flutter_workshop/state/auth_state.dart';
import 'package:flutter_workshop/widgets/login_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Stack(
          children: [
            topSection(context),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
              child: bottomSection(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget topSection(context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlutterLogo(size: 160.0, style: FlutterLogoStyle.stacked),
        SizedBox(
          height: 32.0,
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: LoginForm(),
                    ),
                  );
                  /* Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return HomeScreen();
                  })); */
                },
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget bottomSection(BuildContext context) {
    return Column(
      children: [
        Text(
          'Or via social media',
          style: TextStyle(color: Colors.grey.withOpacity(0.8), fontSize: 18.0),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 32.0,
                width: 32.0,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/facebook.svg'),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            InkWell(
              onTap: () async {
                final user = await AuthService.signInWithGoogle();
                if (user != null) {
                  /* Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  })); */
                } else {
                  print("error logging in");
                }
              },
              child: Container(
                height: 32.0,
                width: 32.0,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/google.svg'),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
