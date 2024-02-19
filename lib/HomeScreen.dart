import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  timer = Provider.of<TimerProvider>(context, listen: false   );
  }
  @override
  Widget build(BuildContext context) {
    // print(' rebuilt');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            " STOP WATCH ",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 2),
          )),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 250,),
              Center(
                child: Container(
                  height: 100,width: 100,
                  child:  Image.asset(
                  'lib/images/a.JPG',
                  fit: BoxFit.cover,
                ),),
              ),
            ],
          ),


        Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Consumer<TimerProvider>(
                builder: (context, value, child) {
                  return Container(
                      child: Consumer<TimerProvider>(builder: (context, value, child) {
                        return Text(value.hour.toString().padLeft(2, '0')+":"+value.minute.toString().padLeft(2, '0')+":"+value.seconds.toString().padLeft(2, '0')+":"+value.milliseconds.toString().padLeft(2, '0'),style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.black
                        ));

                      },),
                      height: 250,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.red,
                            width: 4,
                          )));
                },
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      timer.continueTimer();

                      },
                    child: Container(
                      child: Center(
                        child: Text(
                          "continue",
                          style: TextStyle(fontSize: 25, letterSpacing: 1),
                        ),
                      ),
                      width: 125,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2,color: Colors.red,),
                        borderRadius: BorderRadius.all(Radius.elliptical(20, 30)),
                        color: Colors.blueGrey,
                        gradient: LinearGradient(
                            colors: [Colors.blue, Colors.lightGreenAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red,
                            offset: Offset(10, 20),
                            blurRadius: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      timer.stopTimer();

                      // timer.continueTimer();
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "Pause",
                          style: TextStyle(fontSize: 25, letterSpacing: 0),
                        ),
                      ),
                      width: 125,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2,color: Colors.red,),
                        borderRadius: BorderRadius.all(Radius.elliptical(20, 30)),
                        color: Colors.blueGrey,
                        gradient: LinearGradient(
                            colors: [Colors.amber, Colors.red],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red,
                            offset: Offset(10, 20),
                            blurRadius: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100,),
              GestureDetector(
                onTap: () {
                  timer.stopTimer();
                  timer.startTimer();

                },
                child: Container(
                  child: Center(
                    child: Text(
                      "Restart",
                      style: TextStyle(fontSize: 30, letterSpacing: 1),
                    ),
                  ),
                  width: 125,
                  height: 60,
                  decoration: BoxDecoration(

                    color: Colors.blueGrey,
                    gradient: LinearGradient(
                        colors: [Colors.lightGreen, Colors.lightGreenAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(20),
                      bottomLeft:Radius.circular(30),
                      bottomRight:Radius.circular(40),),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.lightGreen,
                        offset: Offset(10, 20),
                        blurRadius: 40,
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  timer.startTimer();
                  timer.stopTimer();
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "Stop",
                      style: TextStyle(fontSize: 30, letterSpacing: 2),
                    ),
                  ),
                  width: 125,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    gradient: LinearGradient(
                        colors: [Colors.redAccent, Colors.redAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40), bottom: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(10, 20),
                        blurRadius: 40,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),

      ],

      ),
    );
  }
}
