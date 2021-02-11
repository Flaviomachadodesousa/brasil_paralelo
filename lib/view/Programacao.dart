import 'package:brasil_paralelo/repository.dart';
import 'package:brasil_paralelo/view/Login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Programacao extends StatefulWidget {
  @override
  _ProgramacaoState createState() => _ProgramacaoState();
}

class _ProgramacaoState extends State<Programacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Programação')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _header(),
            _drawerItem(
              icon: FontAwesomeIcons.shoppingCart,
              text: ' Programação',
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoginUser())),
            ),
            _drawerItem(
              icon: FontAwesomeIcons.book,
              text: ' Series',
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoginUser())),
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
      body: _buildTaskList(),
    );
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

Widget _buildTaskList() {}
