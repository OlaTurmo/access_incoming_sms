import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:access_incoming_sms/platform_channel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String sms = 'No sms';

  @override
  void initState() {
    super.initState();

    getPermission().then((value) {
      if (value) {
        PlatformChannel().smsStream().listen((event) {
          sms = event;
          setState(() {});
        });
      }
    });
  }

  Future<bool> getPermission() async {
    if (await Permission.sms.status == PermissionStatus.granted) {
      return true;
    } else {
      if (await Permission.sms.request() == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('SMS Reader')),
          backgroundColor: Colors.greenAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Incoming message:',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent),
              ),
              const SizedBox(height: 18),
              Text(
                sms,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.blue),
              ),
              
              String gfg = "rs.ge (s/n an p/n) 305516536: 8516 kods vada gasdis 5 wuTSi";
  String result = gfg;
              gfg = sms;
  
	print(gfg.toLowerCase());
  gfg = result;
  
  result = gfg.replaceAll("TS","ც");
gfg = result;
  
    result = gfg.replaceAll("ts","ც");
gfg = result;
  
  
   result = gfg.replaceAll("w","ვ");
gfg = result;
  
  result = gfg.replaceAll("a","ა");
gfg = result;
  result = gfg.replaceAll("b","ბ");
gfg = result;
  result = gfg.replaceAll("g","გ");
gfg = result;  
  result = gfg.replaceAll("d","დ");
 gfg = result; 
  result = gfg.replaceAll("e","ე");
gfg = result;
  result = gfg.replaceAll("v","ვ");
gfg = result;
  result = gfg.replaceAll("z","ზ");
gfg = result;
  result = gfg.replaceAll("t","თ");
gfg = result;
  result = gfg.replaceAll("i","ი");
gfg = result;
  result = gfg.replaceAll("kʼ","კ");
gfg = result;
  result = gfg.replaceAll("l","ლ");
gfg = result;
  result = gfg.replaceAll("m","მ");
gfg = result;
  result = gfg.replaceAll("n","ნ");
gfg = result;
  result = gfg.replaceAll("o","ო");
gfg = result;
  result = gfg.replaceAll("pʼ","პ");
gfg = result;
  result = gfg.replaceAll("zh","ჟ");
gfg = result;
  result = gfg.replaceAll("r","რ");
gfg = result;
  result = gfg.replaceAll("s","ს");
gfg = result;
  result = gfg.replaceAll("tʼ","ტ");
gfg = result;
  result = gfg.replaceAll("u","უ");
gfg = result;
  result = gfg.replaceAll("p","ფ");
gfg = result;
  result = gfg.replaceAll("k","ქ");
gfg = result;
  result = gfg.replaceAll("gh","ღ");
gfg = result;
  result = gfg.replaceAll("qʼ","ყ");
gfg = result;
  result = gfg.replaceAll("sh","შ");
gfg = result;
  result = gfg.replaceAll("ch","ჩ");
gfg = result;

  result = gfg.replaceAll("dz","ძ");
gfg = result;
  result = gfg.replaceAll("tsʼ","წ");
gfg = result;
  result = gfg.replaceAll("chʼ","ჭ");
gfg = result;
  result = gfg.replaceAll("kh","ხ");
gfg = result;
  result = gfg.replaceAll("j","ჯ");
gfg = result;
  result = gfg.replaceAll("h","ჰ");
gfg = result;
 
  print(gfg);
  
              
              
              
            ],
          ),
        ),
      ),
    );
  }
}
