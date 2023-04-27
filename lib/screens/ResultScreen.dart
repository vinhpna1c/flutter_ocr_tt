import 'dart:io';

import 'package:flutter/material.dart';

import '../styles/app_style.dart';

class ResultScreen extends StatelessWidget {
  final String imagePath;
  const ResultScreen({super.key, this.imagePath = ""});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            }),
        backgroundColor: Colors.white,
        title: Text(
          "Result Screen",
          style: AppStyles.titleText,
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: height * 0.45,
            child: Center(
              child: Image.file(
                File(imagePath),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Text("Data get:"),
                  Text(
                      'Data nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\n'),
                  Text(
                      'Data nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\nData nè Thảo\n')
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
