import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hook_example/api/model.dart';
import 'package:hook_example/soundform.dart';
import 'package:http/http.dart' as http;
import './api/secret.dart';

const dallEHome = '/dallE';
Widget Function(BuildContext) get dallEHomeRoute => (_) => const DallEHome();

class DallEHome extends HookWidget {
  final String imgPrompt;
  final int n;
  final String size;
  const DallEHome(
      {Key? key,
      this.imgPrompt = 'A kitten',
      this.n = 1,
      this.size = '256x256'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(_apiCall);
    final snapshot = useFuture(future, initialData: null);

    useEffect(() {
      log("Error: ${snapshot.error}");
      if (snapshot.data == null) {
        return;
      }
      return;
    }, [snapshot.data]);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            imgPrompt,
            style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          Center(
            child: (snapshot.data == null)
                ? const SoundWidget()
                : ClipRect(
                    child: Image.network(snapshot.data.toString()),
                  ),
          ),
        ],
      ),
    );
  }

  Future<String?> _apiCall() async {
    final dallEObject = DallE(prompt: imgPrompt, n: n, size: size);

    try {
      final response = await http.post(
        dallE,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $apiKey",
        },
        body: jsonEncode(dallEObject),
      );

      log(response.statusCode.toString());

      final Map<String, dynamic> map = jsonDecode(response.body);
      return map['data'][0]['url'];
    } catch (e) {
      log("problem");
      log(e.toString());
      return null;
    }
  }
}
