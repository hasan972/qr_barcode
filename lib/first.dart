import 'dart:io';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class First extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  var code = '';
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(35),
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextFormField(
                    controller: title,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: ' Code ',
                    ),
                  ),
                ),
              ),
              MaterialButton(
                color: Colors.indigo,
                
                onPressed: () {
                  setState(() {
                    code = title.text;
                  });
                },
                child: const Text(
                  "Create",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  
                  ),
                ),
              ),
              code == ''
                  ? const Text('')
                  : BarcodeWidget(
                      barcode: Barcode.qrCode(
                        errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                      ),
                      data: code,
                      width: 200,
                      height: 200,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
