import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  
  static const name = 'progress_screen';
  
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),        
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30,),
          Text('Circular Progress Indicator'),
          SizedBox(height: 20,),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.amber,),
          
          SizedBox(height: 20,),
          Text('Circular y Linear Controlado'),
          SizedBox(height: 10,),
          _ControlledProgressIndicated(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicated extends StatelessWidget {
  const _ControlledProgressIndicated({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 2), (value){
        return (value * 2)/100; // 0.0 - 1.0
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final progressiveValue = snapshot.data?? 0;
        return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                CircularProgressIndicator(value: progressiveValue ,strokeWidth: 2, color: Colors.black87,),
                Expanded(child: 
                LinearProgressIndicator(value: progressiveValue,)
              )
            ],
          ),
        );
      },
    );

  }
}