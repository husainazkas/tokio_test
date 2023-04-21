import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/hide_focus.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HideFocus(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Husain Fadhilah'),
        ),
        body: Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: const [
              _FibonacciField(),
              SizedBox(height: 20.0),
              _PalindromeField(),
              SizedBox(height: 20.0),
              _SortListDataArrayField(),
              SizedBox(height: 20.0),
              _AnagramField(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FibonacciField extends StatefulWidget {
  const _FibonacciField();

  @override
  State<_FibonacciField> createState() => _FibonacciFieldState();
}

class _FibonacciFieldState extends State<_FibonacciField> {
  final TextEditingController _controller = TextEditingController();
  final List<int> fibonacci = [];

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _calculateFibonacci() {
    final text = _controller.text.trim();
    final input = int.tryParse(text);
    if (input != null) {
      fibonacci.clear();
      fibonacci.addAll([0, 1]);
      int c = 1;
      int p = 1;
      int r = 1;
      do {
        fibonacci.add(c);
        r = p + c;
        p = c;
        c = r;
      } while (r <= input);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Fibonacci',
          style: TextStyle(
            fontSize: 18.0,
            decoration: TextDecoration.underline,
          ),
        ),
        const SizedBox(height: 4.0),
        Text('Result: ${fibonacci.join(', ')}'),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Input',
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: _calculateFibonacci,
              child: const Text('Submit'),
            )
          ],
        ),
      ],
    );
  }
}

class _PalindromeField extends StatefulWidget {
  const _PalindromeField();

  @override
  State<_PalindromeField> createState() => _PalindromeFieldState();
}

class _PalindromeFieldState extends State<_PalindromeField> {
  final TextEditingController _controller = TextEditingController();
  bool? _isPalindrome;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _isItPalindrome() {
    final original = _controller.text.trim();
    final splitted = original.split('');
    final reversed = splitted.reversed.toList();
    setState(() {
      _isPalindrome = original == reversed.join();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Palindrome',
          style: TextStyle(
            fontSize: 18.0,
            decoration: TextDecoration.underline,
          ),
        ),
        const SizedBox(height: 4.0),
        Text('Result: ${_isPalindrome ?? ''}'),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Input',
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: _isItPalindrome,
              child: const Text('Submit'),
            )
          ],
        ),
      ],
    );
  }
}

class _SortListDataArrayField extends StatefulWidget {
  const _SortListDataArrayField();

  @override
  State<_SortListDataArrayField> createState() =>
      _SortListDataArrayFieldState();
}

class _SortListDataArrayFieldState extends State<_SortListDataArrayField> {
  final TextEditingController _controller = TextEditingController();
  final List<int> input = [];

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _input() {
    final text = _controller.text.trim();
    final value = int.tryParse(text);
    if (value != null) {
      input.add(value);
      setState(() {});
    }
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sort List Data Array',
          style: TextStyle(
            fontSize: 18.0,
            decoration: TextDecoration.underline,
          ),
        ),
        const SizedBox(height: 4.0),
        const Text('Result: '),
        Row(
          children: [
            Expanded(
              child: Column(
                children: List.generate(
                  input.length,
                  (index) => DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text('${input[index]}'),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              input.removeAt(index);
                            });
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                children: List.generate(
                  input.length,
                  (index) {
                    final sorted = [...input]..sort();
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.5),
                        child: Center(child: Text('${sorted[index]}')),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Input',
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: _input,
              child: const Text('Add'),
            )
          ],
        ),
      ],
    );
  }
}

class _AnagramField extends StatefulWidget {
  const _AnagramField();

  @override
  State<_AnagramField> createState() => _AnagramFieldState();
}

class _AnagramFieldState extends State<_AnagramField> {
  final TextEditingController _controller = TextEditingController();
  final List<String> input = [];
  final List<List<String>> output = [];

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _input() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      final t = text.split(' ');
      input.addAll(t);

      _groupAnagrams();

      setState(() {});
    }
    _controller.clear();
  }

  void _groupAnagrams() {
    output.clear();
    final Map<String, List<String>> map = {};
    for (int i = 0; i < input.length; i++) {
      final chars = input[i].split('');
      chars.sort();
      final str = chars.join();
      map.addAll({
        str: [if (map[str] != null) ...map[str]!, input[i]]
      });
    }
    output.addAll(map.values);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Anagram',
          style: TextStyle(
            fontSize: 18.0,
            decoration: TextDecoration.underline,
          ),
        ),
        const SizedBox(height: 4.0),
        const Text('Result: '),
        Row(
          children: [
            Expanded(
              child: Column(
                children: List.generate(
                  input.length,
                  (index) => DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(input[index]),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            input.removeAt(index);
                            _groupAnagrams();
                            setState(() {});
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                children: output
                    .map((e) => DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.5),
                            child: Center(
                              child: Text(e.join(', ')),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Input',
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: _input,
              child: const Text('Add'),
            )
          ],
        ),
      ],
    );
  }
}
