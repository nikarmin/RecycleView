import 'package:flutter/material.dart';

class Lalala extends StatefulWidget {
  const Lalala({super.key});

  @override
  State<Lalala> createState() => _LalalaState();
}

class _LalalaState extends State<Lalala> {
  int countPlastico = 0;
  int countMetal = 0;
  int countPapel = 0;
  int countVidro = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Form(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 18,
                    width: 18,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (countMetal > 0) {
                            countMetal--;
                          } else {
                            countMetal = 0;
                          }
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(134, 167, 102, 1)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(3)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),
                      child: const Text(
                        '-',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      (countMetal >= 0 ? countMetal.toString() : '0'),
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                    width: 18,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          countMetal++;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(134, 167, 102, 1)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(3)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),
                      child: const Text(
                        '+',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const Text(
                    ' Metal',
                    style: TextStyle(decoration: TextDecoration.none),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 18,
                    width: 18,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (countPlastico > 0) {
                            countPlastico--;
                          } else {
                            countPlastico = 0;
                          }
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(134, 167, 102, 1)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(3)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),
                      child: const Text(
                        '-',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      (countPlastico >= 0 ? countPlastico.toString() : '0'),
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                    width: 18,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          countPlastico++;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(134, 167, 102, 1)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(3)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),
                      child: const Text(
                        '+',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const Text('Plástico')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 18,
                    width: 18,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (countPapel > 0) {
                            countPapel--;
                          } else {
                            countPapel = 0;
                          }
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(134, 167, 102, 1)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(3)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),
                      child: const Text(
                        '-',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      (countPapel >= 0 ? countPapel.toString() : '0'),
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                    width: 18,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          countPapel++;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(134, 167, 102, 1)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(3)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),
                      child: const Text(
                        '+',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const Text('Papel')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 18,
                    width: 18,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (countVidro > 0) {
                            countVidro--;
                          } else {
                            countVidro = 0;
                          }
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(134, 167, 102, 1)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(3)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),
                      child: const Text(
                        '-',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      (countVidro >= 0 ? countVidro.toString() : '0'),
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                    width: 18,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          countVidro++;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(134, 167, 102, 1)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(3)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),
                      child: const Text(
                        '+',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const Text('Vidro')
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
