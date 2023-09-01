import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recycle_view/views/perfil_page.dart';

class ConteudoNoticia extends StatefulWidget {
  const ConteudoNoticia({super.key});

  @override
  State<ConteudoNoticia> createState() => _ConteudoNoticiaState();
}

class _ConteudoNoticiaState extends State<ConteudoNoticia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ImageIcon(AssetImage('assets/images/icons/earth-day.png'),
            color: Colors.black),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: ImageIcon(
              AssetImage('assets/images/icons/account.png'),
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Perfil();
              }));
            },
          ),
        ],
      ),
/////////////////////////////////////////////////////////////////////////////
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/background/pageuau.png')),
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 900,
              child: Stack(
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      height: 250,
                      child: Image.asset(
                        'assets/images/leave.png',
                        fit: BoxFit.fill,
                      )
                      /*decoration: BoxDecoration(
                      image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover
                    )),*/
                      ),
                  Positioned(
                    top: 210,
                    child: Container(
                      width: 390,
                      height: 900,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0)),
                        color: const Color.fromARGB(234, 234, 234, 234),
                      ),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(children: <Widget>[
                            SizedBox(height: 15),
                            Container(
                                width: 370,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  //color: Colors.amber,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/aaaaaaa.png'),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('author',
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ],
                                  ),
                                )),
                            Container(
                                child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Text(
                                        'What is Lorem Ipsum? What is Lorem Ipsum?',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)))),
                            Container(
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Text(
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            //fontWeight: FontWeight.bold,
                                            color: Colors.black)))),
                          ])),
                    ),
                  )
                ],
              ),
            ),
          )),

/////////////////////////////////////////////////////////////////////////////
      backgroundColor: Color.fromRGBO(233, 233, 233, 1),
    );
  }
}
