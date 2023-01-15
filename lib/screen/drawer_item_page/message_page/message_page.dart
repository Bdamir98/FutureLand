import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MessageDemo(),
                ));
              },
              child: Text('data')),
        ],
      ),
    );
  }
}

class MessageDemo extends StatelessWidget {
  const MessageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('data')),
    );
  }
}
