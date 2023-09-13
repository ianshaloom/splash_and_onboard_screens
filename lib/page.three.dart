import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset('assets/images/onboard-3.png'),
        ),
        Expanded(
            //flex: 1,
            child: Column(
          children: [
            Text(
              'All at Your Fingertips',
              style: textTheme.bodyLarge!.copyWith(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Effortless control and insight, anytime, anywhere',
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge!.copyWith(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ))
      ],
    );
  }
}
