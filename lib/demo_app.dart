import 'package:flutter/material.dart';

class DemoApp extends StatefulWidget {
  DemoApp({Key key}) : super(key: key);

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> with SingleTickerProviderStateMixin {
  final DecorationTween decorationTween = DecorationTween(
      begin: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black)),
      end: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black),
          boxShadow: [
            BoxShadow(
                color: Colors.red,
                spreadRadius: 8,
                blurRadius: 5.0,
                offset: Offset(10, 10))
          ]));

  AnimationController _controller;

  bool isClicked = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (isClicked) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
              isClicked = !isClicked;
            },
            child: Center(
              child: DecoratedBoxTransition(
                position: DecorationPosition.background,
                decoration: decorationTween.animate(_controller),
                child: Container(
                    width: 200,
                    height: 100,
                    child: Center(
                      child: Text(
                        'Click me',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
