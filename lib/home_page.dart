import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isElevated = true;
  bool _isDark = true;

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      setState(() {
        _isDark = false;
      });
    }
    return Scaffold(
      backgroundColor: _isDark ? Colors.grey[900] : Colors.grey[300],
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isElevated = !_isElevated;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: _isDark ? Colors.grey[900] : Colors.grey[300],
              borderRadius: BorderRadius.circular(50),
              boxShadow: _isElevated
                  ? _isDark
                      ? [
                          const BoxShadow(
                            color: Colors.black,
                            offset: Offset(4, 4),
                            blurRadius: 15,
                            spreadRadius: 5,
                          ),
                          BoxShadow(
                            color: Colors.grey[800]!,
                            offset: const Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          )
                        ]
                      : [
                          BoxShadow(
                            color: Colors.grey[500]!,
                            offset: const Offset(4, 4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          )
                        ]
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
