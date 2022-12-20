import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hook_example/new_storage.dart';

void main() {
  runApp(const MaterialApp(
    home: DemoWidget(),
  ));
}

late ValueNotifier data;

class DemoWidget extends HookWidget {
  const DemoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    data = useState("0");

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hi there You clicked: ${data.value}"),
            TextButton(
              onPressed: () {
                data.value += "1";
              },
              child: const Text("Click me"),
            ),
            const TextUse(),
          ],
        ),
      ),
    );
  }
}
