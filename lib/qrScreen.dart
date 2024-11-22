import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:zesta/qrScanner.dart';

class Qrscreen extends StatefulWidget {
  const Qrscreen({super.key});

  @override
  State<Qrscreen> createState() => _QrscreenState();
}

class _QrscreenState extends State<Qrscreen> {
  final textController = TextEditingController();
  String errField = "";
    @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
     
    /// Enter your text here to generate the Qr code 
     
            TextFormField(
              controller: textController,
              validator: (value) {
                if (value!.isEmpty) {
                  return errField = "required";
                }
              },
              onChanged: (value) {
                setState(() {});
              },
            ),
            const SizedBox(
              height: 20,
            ),

    /// Generated  Qr will be shown below            
            QrImageView(
              data: textController.text,
              version: QrVersions.auto,
              size: 200.0,
            ),
            const SizedBox(
              height: 30,
            ),

    /// Below button is used for scanning the other Qr code 


            InkWell(onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Qrscanner(),
            ));
            },
              child: Container(
                height: 60,
                width: 220,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    "Scan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
