import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "Hello Mohammed,\n welcome to pets medical center",
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Row(children: [
              Column(
                children: [Text("hello world"), Text("500 hello")],
              )
            ]),
          )
        ]),
      ),
    );
  }
}
