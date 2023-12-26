import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  
  static const name = 'infinite_scroll_screen';
  
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5];
  final scrollController = ScrollController();
  bool isLouding = false;
  bool isMounted = true;


  void addFiveImages(){
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5].map((e) => e + lastId)
    );
  }

  void moveScrollToBottom(){
    if (scrollController.position.pixels+100 <= scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
        scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn
      );
  }

  Future loadNextPage() async {
    if (isLouding) return;
    isLouding = true;
    setState(() { });
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLouding = false;
    if (!isMounted) return;
    setState(() { });
    moveScrollToBottom();
  }

  Future<void> onRefresh() async{
    isLouding = true;
    if (!isMounted) return;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    final lastId = imagesIds.last;
    
    isLouding = false;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    setState(() {});
  }

  @override
  void initState() {    
    super.initState();
    //No necesita parametros porque toma los valores del scroll ya definido
    scrollController.addListener(() { 
      if ((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
        loadNextPage();
      }
      
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index){          
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'));
            },        
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> context.pop(), 
        child: isLouding?
          FadeIn(
            child: SpinPerfect(
            infinite: true,
            child: const Icon(Icons.refresh_outlined)),
          )
          :FadeIn(child: const Icon(Icons.arrow_back))
      ),
    );
  }
}