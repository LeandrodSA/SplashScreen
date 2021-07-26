import 'package:dadosporrotas/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  final TextEditingController nameControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotas Nomeadas'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new TextField(
              controller: nameControl,
              decoration: new InputDecoration(labelText: 'Entre com seu nome')
            ),
            
            Padding(padding: EdgeInsets.all(35)),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ExtractArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Olá '+nameControl.text,
                    'Esta mensagem é extraida no método',
                  ),
                );
              },
              child: Text('Clique para enviar dados'),
            ),
            Padding(padding: EdgeInsets.all(8)),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PassArgumentsScreen.routeName,
                    arguments: ScreenArguments('Olá '+nameControl.text,
                        'Esta mensagem é extraída na funcão on GenerateRoute'));
              },
              child: Text('Navegue até uma rota que aceita argumentos'),
            ),
          ],
        ),
      ),
    );
  }
}