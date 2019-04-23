import 'package:flutter/material.dart';
import 'package:so_tops/screens/edit_screen.dart';
import 'package:so_tops/screens/signup_screen.dart';
import 'package:so_tops/tabs/home_tab.dart';
import 'package:so_tops/widgets/custom_drawer.dart';
import 'package:so_tops/widgets/user_avatar.dart';

class HomeScreen extends StatelessWidget {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(    // TELA 1 (HOME)
          appBar: AppBar(
            title: Text("Só Tops"),
            centerTitle: true,
            actions: <Widget>[
              UserAvatar(),
            ],
          ),
          body: HomeTab(),
          drawer: CustomDrawer(pageController),
        ),
        Scaffold(   // TELA 2 (FILMES)
          appBar: AppBar(
            title: Text("Filmes"),
            centerTitle: true,
            actions: <Widget>[
              UserAvatar(),
            ],
          ),
          body: Container(),
          drawer: CustomDrawer(pageController),
        ),
        Scaffold(   // TELA 3 (Jogos)
          appBar: AppBar(
            title: Text("Jogos"),
            centerTitle: true,
            actions: <Widget>[
              UserAvatar(),
            ],
          ),
          body: Container(),
          drawer: CustomDrawer(pageController),
        ),
        Scaffold(    // TELA 4 (Restaurantes)
          appBar: AppBar(
            title: Text("Restaurantes"),
            centerTitle: true,
            actions: <Widget>[
              UserAvatar(),
            ],
          ),
          body: Container(),
          drawer: CustomDrawer(pageController),
        ),
        Scaffold(    // TELA 5 (Favoritos)
          appBar: AppBar(
            title: Text("Favoritos"),
            centerTitle: true,
            actions: <Widget>[
              UserAvatar(),
            ],
          ),
          body: Container(),
          drawer: CustomDrawer(pageController),
        ),
        Scaffold(    // TELA 6 (Editar Perfil)
          body: EditScreen(),
        ),
      ],
    );
  }
}
