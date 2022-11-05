class DallE {
  final String prompt;
  final int n;
  final String size;

  const DallE({required this.prompt, required this.n, required this.size});

  factory DallE.fromJson(Map<String, dynamic> jsonData) => DallE(
      prompt: jsonData['prompt'],
      n: int.parse(jsonData['n']),
      size: jsonData['size']);

  Map<String, dynamic> toJson() => {
    'prompt' : prompt,
    'n' : n,
    'size' : size
  };

  @override
  String toString() => "$prompt $n $size";
}
