import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:itau_redesign/screens/home/servicos.dart';
import 'package:itau_redesign/screens/home/transacoes.dart';

import 'widgets/cartao_digital.dart';
import 'widgets/cartao_fisico.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(20, 15),
                    topRight: Radius.elliptical(20, 15),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Saldo em conta",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    "R\$",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    "1.280.000,00",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.orange,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Image.asset("assets/images/estrato.PNG"),
                              Text(
                                "Ver extrato",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey.shade200,
                height: MediaQuery.of(context).size.height,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
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
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        children: const [
                          CartaoFisicoItau(),
                          CartaoDigitalItau()
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.easeIn,
                      width: 300,
                      height: _isPanelExpanded ? 200 : 70,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Meus Investimentos",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _isPanelExpanded = !_isPanelExpanded;
                                    });
                                  },
                                  child: Icon(
                                    !_isPanelExpanded
                                        ? Icons.keyboard_arrow_down_outlined
                                        : Icons.keyboard_arrow_up_outlined,
                                    color: Colors.orange,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Total investido",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      children: [
                                        Text(
                                          "R\$",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          "10.925.000,00",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey.shade600,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Total investido",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      "+5%",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            Divider(),
                            Row(
                              children: [
                                Image.asset("assets/images/search.PNG"),
                                SizedBox(width: 4),
                                Text(
                                  "Ver detalhes",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 12,
                                  ),
                                ),
                                Spacer(),
                                Image.asset("assets/images/dolar.PNG"),
                                SizedBox(width: 4),
                                Text(
                                  "Investir mais",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.easeIn,
                      width: 300,
                      height: _isPanelExpanded2 ? 200 : 70,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Crédito Pré-aprovado",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _isPanelExpanded2 = !_isPanelExpanded2;
                                    });
                                  },
                                  child: Icon(
                                    !_isPanelExpanded2
                                        ? Icons.keyboard_arrow_down_outlined
                                        : Icons.keyboard_arrow_up_outlined,
                                    color: Colors.orange,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Financiamento de automóvel",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      children: [
                                        Text(
                                          "R\$",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          "350.000,00",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                        SizedBox(width: 90),
                                        Text(
                                          "Simular",
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(height: 20),
                            Divider(),
                            Row(
                              children: [
                                Image.asset("assets/images/outros.PNG"),
                                SizedBox(width: 4),
                                Text(
                                  "Ver outros",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const TransacoesPage(),
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
