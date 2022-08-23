import 'package:flutter/material.dart';
import 'package:talk/widgets/bgpainter.dart';

class BBVAPage extends StatelessWidget {
  final VoidCallback menu;
  const BBVAPage({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      appBar:
          AppBar(
            elevation: 0,
            backgroundColor: const Color(0xFF024282),
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: menu,
                    child: const Icon(Icons.menu, size: 24)),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text("Hola Juan"),
                ),
                SizedBox(
                  width: 24,
                )
              ],
            ),
      ),
      body: Stack(
        children: [
          HeroHome(),
          Container(
          width: sizeScreen.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: sizeScreen.width,
                  padding: EdgeInsets.all(24),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 64),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text("Texto prueba", style: TextStyle(
                        fontSize: 64
                      ),),
                      Text("Texto prueba2",style: TextStyle(
                          fontSize: 48
                      ),),
                    ],
                  ),
                )
              ],
            ),
          ),
          ),
        ],
      ),
    );
  }
}
