import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  
  static String name = 'counter_screen';
  
  const CounterScreen({super.key});
    
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final counterClick = ref.watch(counterProvider);
    final isThemeDark = ref.watch(isDarkMode);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contando Clicks'),   
        actions: [
          IconButton(
            onPressed: (){ref.read(isDarkMode.notifier).update((state) => !state);}, 
            icon: isThemeDark? const Icon(Icons.light_mode_outlined): const Icon(Icons.dark_mode_outlined)
          )
        ],     
      ),
      body: Center(
        child: Text('Valor $counterClick', style: Theme.of(context).textTheme.bodyMedium),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.ac_unit_outlined),
        onPressed: (){    
          // ref.read(counterProvider.notifier).state++;    
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
      ),
    );    
  }
}
