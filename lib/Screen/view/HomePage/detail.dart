import 'package:exam_app/Screen/view/HomePage/Homepage.dart';
import 'package:exam_app/examapp/class/class.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Contact data = ModalRoute.of(context)!.settings.arguments as Contact;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text(data.name),
              subtitle: Text("${data.std}"),
            ),
          ],
        ),
      ),
    );
  }
}
