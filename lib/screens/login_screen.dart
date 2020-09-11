import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(size: 150.0, style: FlutterLogoStyle.stacked,),

              SizedBox(height: 16.0,),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(child: Text('Login In', style: TextStyle(color: Colors.black, fontSize: 18.0),)),
                      ),
                    ),
                  ),

                  SizedBox(width: 10.0,),

                  Expanded(
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(30)
                       ),
                       child: Center(child: Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 18.0),)),
                    ),
                  ),


                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
