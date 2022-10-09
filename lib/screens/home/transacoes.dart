import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:itau_redesign/screens/home/home.dart';
import 'package:itau_redesign/screens/home/servicos.dart';

import 'widgets/cartao_digital.dart';
import 'widgets/cartao_fisico.dart';

class TransacoesPage extends StatefulWidget {
  const TransacoesPage({Key? key}) : super(key: key);

  @override
  State<TransacoesPage> createState() => _TransacoesPageState();
}

class _TransacoesPageState extends State<TransacoesPage> {
  bool _isPanelExpanded = false;
  bool _isPanelExpanded2 = false;
  final List<Widget> pages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            tileMode: TileMode.repeated,
            begin: Alignment.topRight,
            end: Alignment.center,
            colors: const [
              Color(0XFFFF8500),
              Color(0XFFFB8201),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/icon_account.png",
                      width: 60,
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Boa tarde,",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "João",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(20, 15),
                    topRight: Radius.elliptical(20, 15),
                  ),
                ),
                height: MediaQuery.of(context).size.height,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "O que deseja fazer ?",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 100,
                          mainAxisSpacing: 10,
                        ),
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        children: const [
                          ServiceButton(
                            title: "Pix",
                            icon: "pix.PNG",
                          ),
                          ServiceButton(
                            title: "Pagar",
                            icon: "qr.PNG",
                          ),
                          ServiceButton(
                            title: "Cartões",
                            icon: "card.PNG",
                          ),
                          ServiceButton(
                            title: "Investir",
                            icon: "investir.PNG",
                          ),
                          ServiceButton(
                            title: "Crédito",
                            icon: "credito.PNG",
                          ),
                          ServiceButton(
                            title: "Cobrar",
                            icon: "cobranca.PNG",
                          ),
                          ServiceButton(
                            title: "Transferir",
                            icon: "transferir.PNG",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const HomePage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const ServicosPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
          }
        },
        selectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
            label: "Início",
            icon: Image.asset(
              "assets/images/home.PNG",
              width: 28,
            ),
          ),
          BottomNavigationBarItem(
            label: "Transações",
            icon: Image.asset(
              "assets/images/transacoes.PNG",
              width: 46,
            ),
          ),
          BottomNavigationBarItem(
            label: "Serviços",
            icon: Image.asset(
              "assets/images/servicos.PNG",
              width: 28,
            ),
          ),
          BottomNavigationBarItem(
            label: "Ajuda",
            icon: Image.asset(
              "assets/images/ajuda.PNG",
              width: 28,
            ),
          )
        ],
      ),
    );
  }
}
