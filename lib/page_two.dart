import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset('assets/images/onboard-2.png'),
        ),
        Expanded(
            //flex: 1,
            child: Column(
          children: [
            Text(
              'Work Seamlessly',
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
                'Get all your work done seamlessly from any interruptions',
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
