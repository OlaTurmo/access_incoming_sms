import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:read_sms/platform_channel.dart';

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
  String call = 'No call';

  @override
  void initState() {
    super.initState();
    //
    // getSmsPermission().then((value) {
    //   if (value) {
    //     PlatformChannel().smsStream().listen((event) {
    //       sms = event;
    //       setState(() {});
    //     });
    //   }
    // });

    getPhonePermission().then((value) {
      if (value) {
        PlatformChannel().smsStream().listen((event) {
          call = event;
          print("telefon: ${event}");
          setState(() {});
        });
      }
    });
  }


  Future<bool> getSmsPermission() async {
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

  Future<bool> getPhonePermission() async {
    if (await Permission.contacts.status == PermissionStatus.granted) {
      return true;
    } else {
      if (await Permission.contacts.request() == PermissionStatus.granted) {
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
          title: const Text('Read Sms and Call'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Incoming message -',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
              Text(sms),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Incoming call -',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
              Text(call),
            ],
          ),
        ),
      ),
    );
  }
}
