import 'package:detectdevice/blocs/bloc_info_device.dart';
import 'package:flutter/material.dart';
import 'package:freerasp/freerasp.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final BlocInfoDevice blocInfoDevice = BlocInfoDevice();

  @override
  void initState() {
    super.initState();
    blocInfoDevice.deviceInfoPlusProvider.deviceInfoService.getInfo();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Flutter isModified: ${blocInfoDevice.isModified}',
              ),
              Text(
                'Flutter isVirtual: ${blocInfoDevice.isVirtualDevice}',
              ),
              FutureBuilder<bool>(
                future: blocInfoDevice.isJailbreak,
                builder: (context, snapshot) {
                  if (snapshot.data != null && !snapshot.hasError) {
                    return Text(
                      'Flutter isJailbreak: ${snapshot.data}',
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
              FutureBuilder<bool>(
                future: blocInfoDevice.isTamperingRisk,
                builder: (context, snapshot) {
                  if (snapshot.data != null && !snapshot.hasError) {
                    return Text(
                      'Flutter Tampering risk: ${snapshot.data}',
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
              StreamBuilder<Threat>(
                builder: (context, snapshot) {
                  final Threat? data = snapshot.data;
                  if (data != null) {
                    return Text(data.toString());
                  }
                  return const CircularProgressIndicator();
                },
              ),
              Text(
                'Flutter infotype: ${blocInfoDevice.deviceModelInfoPlus.deviceInfo}',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
