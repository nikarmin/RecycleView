import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login2.dart';

class HomeScreen extends StatefulWidget {
final User user;

HomeScreen({required this.user});

@override
_HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
late User _currentUser;

@override
void initState() {
  _currentUser = widget.user;
  super.initState();
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.deepOrangeAccent,
      title: Text('HomeScreen'),
      centerTitle: true,
    ),

    body: WillPopScope(
      onWillPop: () async {
        final logout = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to logout from this App'),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    Logout();
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return logout!;
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'NAME: ${_currentUser.displayName}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 16.0),
            Text(
              'EMAIL: ${_currentUser.email}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: const Text('Sign out'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent),
              ),
            ),
          ],
        ),
      ),
    )

  );
}

Future<dynamic> Logout() async {

  await FirebaseAuth.instance.signOut();

  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => LoginScreen(),
    ),
  );
}
}