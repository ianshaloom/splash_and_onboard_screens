import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset('assets/images/onboard-1.png'),
        ),
        Expanded(
            //flex: 1,
            child: Column(
          children: [
            Text(
              'Skyrocket Your Productivity',
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
                'Thrifta helps you fuel remarkable growth, one successful launch at a time',
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
