import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: MyHomePage(title: 'ITESO APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage>{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                'https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg',
                fit: BoxFit.fill,
              ),
            ),
            
            const Likes(),
            const IconButtonRow(),

          const Padding(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Text('El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente) es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957.La institución forma parte del Sistema Universitario Jesuita que integra a ocho universidades en México.', textAlign: TextAlign.justify, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          )

          ],
        ),
    );
  }
}

class Likes extends StatefulWidget {
  const Likes({super.key});

  @override
  State<Likes> createState() => _Likes();
}

class _Likes extends State<Likes>{
  bool isLiked = false;
  int counter = 0;

  void _countLikes(){
    setState(() {
      if(isLiked){
        isLiked = false;
        counter--;
      }else{
        isLiked = true;
        counter++;
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                title: const Text('El ITESO, Universidad Jesuita de Guadalajara', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                subtitle: const Text('San Pedro, Tlaquepaque, Jal'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        _countLikes();
                      },
                      color: isLiked ? Colors.blueAccent : Colors.black,
                      icon: const Icon(Icons.thumb_up),
                    ),
                    Text('$counter')
                  ],
                ),
              ),
            );
    }
}

class IconButtonRow extends StatefulWidget {
  const IconButtonRow({super.key});

  @override
  State<IconButtonRow> createState() => _IconButtonRow();
}

class _IconButtonRow extends State<IconButtonRow>{
  bool isMailPressed = false;
  bool isCallPressed = false;
  bool isRoutePressed = false;

  @override
  Widget build(BuildContext context){
    return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Column(
                        children: [
                          IconButton(
                            color: isMailPressed ? Colors.indigo : Colors.black,
                            onPressed: () {
                              if(isMailPressed == false){
                                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('You pressed the mail icon'),
                                  ),
                                );
                              }

                              setState(() {
                                isMailPressed = !isMailPressed;
                              });
                            },
                            icon: const Icon(Icons.mail, size: 50),
                          ),
                          const SizedBox(height: 15,),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Correo', style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Column(
                        children: [
                          IconButton(
                            color: isCallPressed ? Colors.indigo : Colors.black,
                            onPressed: () {
                              if(isCallPressed == false){
                                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('You pressed the call icon'),
                                  ),
                                );
                              }

                              setState(() {
                                isCallPressed = !isCallPressed;
                              });
                            },
                            icon: const Icon(Icons.add_ic_call_sharp, size: 50),
                          ),
                          const SizedBox(height: 15,),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Llamada', style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          color: isRoutePressed ? Colors.indigo : Colors.black,
                          onPressed: () {
                            if(isRoutePressed == false){
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('You pressed the route icon'),
                                ),
                              );
                            }

                            setState(() {
                              isRoutePressed = !isRoutePressed;
                            });
                          },
                          icon: const Icon(Icons.directions, size: 50),
                        ),
                        const SizedBox(height: 15,),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text('Ruta', style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
  }
}