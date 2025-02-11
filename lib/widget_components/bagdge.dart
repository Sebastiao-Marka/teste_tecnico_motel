import 'package:flutter/material.dart';

//seria a bolinha vermelha de numeros de itens no carinho
class Badgee extends StatelessWidget {
  final Widget child;
  final String value;

  const Badgee({
    super.key,
    required this.child,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 5,
          top: 5,
          child: ClipOval(
            child: Container(
              width: value.length * 15.0,
              height: value.length * 15.0,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.red,
              ),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
