import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget{

  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton( child: const Icon(Icons.arrow_back_ios_new_outlined),
      onPressed: (){context.pop();}),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,          
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: (){}, child: const Text('Elevated Button')),
            const ElevatedButton(onPressed: null, child: Text('Disable Button')),
            ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.access_alarm_rounded), label: const Text('Elevated Button'),),
            FilledButton(onPressed: (){}, child: const Text('Filled Button')),
            FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.abc_sharp), label: const Text('Fille Icon')),
            OutlinedButton(onPressed: (){}, child: const Text('Outlined Button')),
            OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.access_alarm_outlined ), label: const Text('Outlined Icon')),
            TextButton(onPressed: (){}, child: const Text("Text Button")),
            TextButton.icon(onPressed: (){}, label: const Text("Text Icon"),icon:  const Icon(Icons.dangerous),),
            
            const CustomButton(),

            IconButton(onPressed: (){}, icon: const Icon(Icons.zoom_in_map)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.api_sharp),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Material(
        color: Colors.blue,
        child: InkWell(
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Text("Custom Button", style: TextStyle(color: colors.primary)),
          ),
        ),
      ),
    );
  }
}