import 'package:brasil_paralelo/controller/ApiController.dart';
import 'package:brasil_paralelo/model/SeriesModel.dart';
import 'package:brasil_paralelo/repository.dart';
import 'package:brasil_paralelo/view/Programacao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';

class Series extends StatefulWidget {
  @override
  _SeriesState createState() => _SeriesState();
}

class _SeriesState extends State<Series> {
  var _series = new List<SeriesModel>();

  _getSeries() {
    APISerie.getSerie().then((response) {
      setState(() {
        Iterable list = json.decode(utf8.decode(response.bodyBytes));
        _series = list.map((model) => SeriesModel.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getSeries();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Series')),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _header(),
              _drawerItem(
                icon: FontAwesomeIcons.shoppingCart,
                text: ' Programação',
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Programacao())),
              ),
              _drawerItem(
                icon: FontAwesomeIcons.book,
                text: ' Series',
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Series())),
              ),
              _drawerItem(
                icon: FontAwesomeIcons.clipboardList,
                text: ' Filmes',
              ),
              _drawerItem(
                icon: FontAwesomeIcons.moneyBillAlt,
                text: ' Podcasts',
              ),
              _drawerItem(
                icon: Icons.note,
                text: ' Novidades',
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(10, 100, 0, 5),
                title: Text('Version 0.0.1'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: _series == null ? 0 : _series.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              elevation: 8,
              child: Container(
                height: 100.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topLeft: Radius.circular(5)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(_series[index].img))),
                    ),
                    Container(
                      height: 100,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 12, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _series[index].titulo,
                              style: TextStyle(fontSize: 21),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                              child: Container(
                                width: 170,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.teal),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Text(
                                  _series[index].categoria,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                              child: Container(
                                width: 230,
                                child: Text(
                                  "Duração: " + _series[index].duracao,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 48, 48, 54)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}

// Header Drawer
Widget _header() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(color: Colors.blue),
      child: UserAccountsDrawerHeader(
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("assets/max.jpg"))),
        accountName: new Text("Flavio Machado de Sousa"),
        accountEmail: new Text("flavio.sos.machado@gmail.com"),
        currentAccountPicture: new CircleAvatar(
          backgroundImage: NetworkImage(user),
        ),
      ));
}

// Lista do Menu lateral
Widget _drawerItem({IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
