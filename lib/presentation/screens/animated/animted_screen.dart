import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  
  static const name = 'animated_screen';
  
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadious = 10.0;

  void changeShape(){
    final random = Random();
    width = random.nextInt(300) + 50;  //va de 0 hasta 300, 50 para que sea el minimo
    height = random.nextInt(700) + 50; 
    color = Color.fromRGBO(
      random.nextInt(255), 
      random.nextInt(255), 
      random.nextInt(255), 
      1
    );
    borderRadious = random.nextDouble() * 100;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeOutCirc,
          width: width <= 0 ? 0: width,
          height: height <= 0 ? 0: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadious <= 0 ? 0:borderRadious),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          changeShape();
        },
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}