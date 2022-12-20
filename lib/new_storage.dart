import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hook_example/demo.dart';

class TextUse extends HookWidget {
  const TextUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message = useFuture(_call(), initialData: "Hi");

    useEffect(() {
      if (message.hasError) {
        log(message.error.toString());
      }
      return;
    }, [message.data]);

    return Text(
        message.data.toString()
    );
  }

  Future<String> _call() async {
    return data.value;
  }
}
