import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Busca la comida',
      caption: 'Eu aute elit aute amet.',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'Entrega Rápida',
      caption:
          'Id aute amet officia esse consectetur pariatur consequat minim excepteur non officia et.',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'Disfruta la comida',
      caption: 'Esse adipisicing cupidatat in sunt.',
      imageUrl: 'assets/images/3.png'),
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  get onPressed => null;
  final pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() { 
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length -1.5)){
        setState(() {
          endReached = true;
        });
      }
    });
  }

  //DESPUES DE MANIPULAR EL ESTADO CREAR EL DISPOSE PARA EL ESTADO
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl))
                  .toList()),
          Positioned(
            right: 20,
            top: 50,
              child: TextButton(
            child: const Text('Omitir'),
            onPressed: () => context.pop(),
          )),

          endReached ? 
            Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(child: const Text('Comenzar'), onPressed:()=>context.pop() )))
            : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.titleLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(
            height: 20,
          ),
          Text(title, style: titleStyle),
          const SizedBox(
            height: 10,
          ),
          Text(
            caption,
            style: captionStyle,
          )
        ],
      ),
    );
  }
}
