import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laba/matiereBrute.dart';
import 'package:laba/matiereFini.dart';
import 'package:laba/service/getMatiereBrute.dart';
import 'package:laba/service/getMatiereFini.dart';

class AccuilLabo extends ConsumerStatefulWidget {
  const AccuilLabo({Key? key}) : super(key: key);

  @override
  AccuilLaboState createState() => AccuilLaboState();
}

class AccuilLaboState extends ConsumerState<AccuilLabo> {
  MediaQueryData mediaQueryData(BuildContext context) {
    return MediaQuery.of(context);
  }

  Size size(BuildContext buildContext) {
    return mediaQueryData(buildContext).size;
  }

  double width(BuildContext buildContext) {
    return size(buildContext).width;
  }

  double height(BuildContext buildContext) {
    return size(buildContext).height;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 900) {
            return horizontalView(height(context), width(context), context);
          } else {
            return verticalView(height(context), width(context), context);
          }
        },
      ),
    );
  }

  Widget horizontalView(double height, double width, context) {
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              height: 80,
              color: Color(0xFFF4B012), //Color(0xFFFCEBD1),
              child: Row(
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  const Text('Gestion du laboratoire'),
                  const Spacer(),
                  IconButton(
                      tooltip: 'Refresh le tout',
                      onPressed: () {
                        ref.refresh(getDataMatiereBruteFuture);
                        ref.refresh(getDataMatiereFiniFuture);
                      },
                      icon: const Icon(Icons.refresh)),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.center,
              height: height - 180,
              child: Container(
                height: 200,
                child: Row(children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Card(
                        elevation: 10,
                        child: InkWell(
                          child: Container(
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage('assets/fourni.jpg'),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                const Text(
                                  'Approvisionner',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MatiereBrutee()),
                            );
                          },
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Card(
                        elevation: 10,
                        child: InkWell(
                          child: Container(
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage('assets/fini.jpg'),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                const Text(
                                  'Gestion de la matière finie',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MatiereFiniPage()),
                            );
                          },
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget verticalView(double height, double width, context) {
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              height: 80,
              color: Color(0xFFF4B012), //Color(0xFFFCEBD1),
              child: Row(
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  const Text('Gestion du laboratoire'),
                  const Spacer(),
                  IconButton(
                      tooltip: 'Refresh le tout',
                      onPressed: () {
                        ref.refresh(getDataMatiereBruteFuture);
                        ref.refresh(getDataMatiereFiniFuture);
                      },
                      icon: const Icon(Icons.refresh)),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              height: height - 180,
              child: Container(
                height: 200,
                child: Row(children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Card(
                        elevation: 10,
                        child: InkWell(
                          child: Container(
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage('assets/fourni.jpg'),
                                        //
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                const Text(
                                  'Approvisionner',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MatiereBrutee()),
                            );
                          },
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Card(
                        elevation: 10,
                        child: InkWell(
                          child: Container(
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage('assets/fini.jpg'),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                const Text(
                                  'Gestion de la matière finie',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MatiereFiniPage()),
                            );
                          },
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
