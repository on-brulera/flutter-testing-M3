import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  
  static const name = 'snackbar_screen';
  
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();
    
    final snackBar = SnackBar(
      content: const Text('Mensaje querido'),
      action: SnackBarAction(label: 'OK', onPressed: (){}),
      duration: const Duration(seconds: 1),
    );
    
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y dialogos'),
      ),
      body: Center(child:       
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(context: context, 
                children: [const Text('Mollit cupidatat consequat excepteur exercitation ut culpa commodo et consequat aliqua labore. Sint do quis adipisicing veniam officia minim. Ad irure officia culpa id quis esse magna culpa dolore. Commodo mollit eiusmod ea sit ad. Eiusmod do magna irure nulla incididunt nisi ipsum ex.')
                ]);
              }, 
              child: const Text('tonal button')
            ),
            FilledButton.tonal(onPressed: () => openDialog(context), child: const Text('Mostrar Pantalla')),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: ()=>showCustomSnackbar(context), 
      ),
    );
  }
}

void openDialog(BuildContext context){
  showDialog(context: context, 
  barrierDismissible: false,
  builder: (context) => 
    AlertDialog(
      title: const Text('Estas seguro'),
      content: const Text('Laborum qui laborum amet consectetur amet in velit labore culpa labore ut ipsum non. Sit et anim pariatur nulla in eiusmod nisi tempor pariatur irure consectetur ipsum dolore. Minim eu incididunt anim mollit consequat voluptate minim sunt aliqua aliqua voluptate. Labore proident culpa laboris esse proident dolore. Cupidatat non sunt excepteur aliqua officia est nostrud magna dolore. Laboris sit amet elit cillum officia ipsum deserunt enim ad velit occaecat commodo consequat culpa.'),
      actions: [
        TextButton(onPressed: ()=> context.pop(), child: const Text('Cancelar')),
        FilledButton(onPressed: (){context.pop();}, child: const Text('Aceptar')),
      ],
    )
  );
}