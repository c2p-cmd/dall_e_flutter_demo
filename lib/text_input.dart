import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hook_example/new_home.dart';

const textInput = '/textInput';
Widget Function(BuildContext) get textInputRoute =>
    (_) => const TextInputForDallE();

class TextInputForDallE extends HookWidget {
  const TextInputForDallE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final navigatorState = Navigator.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dall E Example App"),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Input your Dall E Prompt"),
          TextField(controller: textController),
          ElevatedButton(
            onPressed: () {
              final promptText = textController.text;
              if (promptText.isEmpty) {
                navigatorState.pushNamed(dallEHome);
              } else {
                navigatorState.push(
                  MaterialPageRoute(
                    builder: (_) => DallEHome(
                      imgPrompt: promptText,
                    ),
                  ),
                );
              }
            },
            child: const Icon(
              Icons.arrow_forward_rounded,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
