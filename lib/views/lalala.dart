import 'package:flutter/material.dart';

class Lalala extends StatefulWidget {
  const Lalala({super.key});

  @override
  State<Lalala> createState() => _LalalaState();
}

class _LalalaState extends State<Lalala> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Form(
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                            if (count > 0) {
                              count--;
                            } else {
                              count = 0;
                            }
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(134, 167, 102, 1)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(3)),
                          shape:
                              MaterialStateProperty.all(const CircleBorder()),
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
                        (count >= 0 ? count.toString() : '0'),
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
                            count++;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(134, 167, 102, 1)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(3)),
                          shape:
                              MaterialStateProperty.all(const CircleBorder()),
                        ),
                        child: const Text(
                          '+',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const Text('Metal')
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
                            if (count > 0) {
                              count--;
                            } else {
                              count = 0;
                            }
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(134, 167, 102, 1)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(3)),
                          shape:
                              MaterialStateProperty.all(const CircleBorder()),
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
                        (count >= 0 ? count.toString() : '0'),
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
                            count++;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(134, 167, 102, 1)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(3)),
                          shape:
                              MaterialStateProperty.all(const CircleBorder()),
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
                            if (count > 0) {
                              count--;
                            } else {
                              count = 0;
                            }
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(134, 167, 102, 1)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(3)),
                          shape:
                              MaterialStateProperty.all(const CircleBorder()),
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
                        (count >= 0 ? count.toString() : '0'),
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
                            count++;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(134, 167, 102, 1)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(3)),
                          shape:
                              MaterialStateProperty.all(const CircleBorder()),
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
                            if (count > 0) {
                              count--;
                            } else {
                              count = 0;
                            }
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(134, 167, 102, 1)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(3)),
                          shape:
                              MaterialStateProperty.all(const CircleBorder()),
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
                        (count >= 0 ? count.toString() : '0'),
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
                            count++;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(134, 167, 102, 1)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(3)),
                          shape:
                              MaterialStateProperty.all(const CircleBorder()),
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
        ),
      ],
    );
  }
}
