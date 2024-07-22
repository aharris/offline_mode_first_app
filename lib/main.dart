import 'package:flutter/material.dart';

import 'package:offline_mode_first_app/services/api_service.dart';
import 'package:offline_mode_first_app/services/index.dart';
import 'package:offline_mode_first_app/services/sembast_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Services().init();

  await getIt<SembastService>().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String _hello = '';
  late bool _done = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getIt<SembastService>().init();

      getIt<ApiService>().getHello().listen((res) {
        setState(() {
          _hello = res;
        });
      }).onDone(() {
        setState(() {
          _done = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Offline Mode First'),
      ),
      body: Stack(
        children: [
          Center(
              child: _hello.isNotEmpty
                  ? Text(
                      _hello,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  : const CircularProgressIndicator()),
          Visibility(
            visible: !_done,
            child: const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Dialog(
                backgroundColor: Color.fromRGBO(0, 0, 0, .1),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Loading...'),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
