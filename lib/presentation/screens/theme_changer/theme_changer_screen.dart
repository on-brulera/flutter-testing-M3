import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  
  static String name = 'theme-changer-screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final isDark = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon:  isDark? const Icon(Icons.light_mode_outlined): const Icon(Icons.dark_mode_outlined),
            onPressed: (){
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              // ref.read(isDarkMode.notifier).update((state) => !state);
            // onPressed: (){ref.read(isDarkMode.notifier).update((state) => !state);}, 
            }, 
          )
        ],        
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {  
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    
    final colors = ref.watch(colorListProvider);
    final int colorIndexProvider = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index, 
          groupValue:colorIndexProvider, 
          onChanged: (value) {
            ref.read(themeNotifierProvider.notifier).changeColorIndex(value?? 0);
          },
        );
      },
    );
  }
}