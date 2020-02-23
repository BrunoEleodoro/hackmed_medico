import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var lista = new List();
  var token = "";
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      Response response = await Dio().post(
          "http://brunoeleodoro.com:4000/users/auth",
          data: {'email': 'bruno@gmail.com', 'senha': '123456'});
      setState(() {
        token = response.data['token'];
      });
      response = await Dio().get(
          "http://brunoeleodoro.com:4000/atendimento/listar",
          options: Options(headers: {
            'Content-type': 'application/json',
            'Authorization': 'Bearer ' + token
          }));
      setState(() {
        lista = response.data['response'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de pacientes'),
      ),
      body: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(lista[index]['nome']),
              subtitle: Text(lista[index]['sentimentos']),
            );
          }),
    );
  }
}
