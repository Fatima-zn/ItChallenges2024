import 'package:flutter/material.dart';

class PageDesign extends StatelessWidget {
  final Widget content;
  const PageDesign({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -295,
            right: -375,
            child: Container(
              width: 600,
              height: 600,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xfff8f9ff)
              ),
            )
          ),

          Positioned(
            top: -185,
            right: -180,
            child: Container(
              width: 496,
              height: 496,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3,
                  color: const Color(0xfff8f9ff)
                )
              ),
            )
          ),

          Positioned(
            top: 585,
            right: 260,
            child: Transform.rotate(
              angle: 27.09,
              child: Container(
                width: 372,
                height: 372,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    width: 3,
                    color: const Color(0xfff8f9ff)
                  )
                ),
              ),
            )
          ),

          Positioned(
            top: 590,
            right: 260,
            child: Container(
              width: 372,
              height: 372,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  width: 3,
                  color: const Color(0xfff8f9ff)
                )
              ),
            )
          ),

          //Content widget
          //the Align widget is used, because in some screens, the content is displayed only on a half part of the screen rather than the whole device screen
          Align(
            alignment: Alignment.center,
            child: content
          )
        ],
      ),
    );
  }
}