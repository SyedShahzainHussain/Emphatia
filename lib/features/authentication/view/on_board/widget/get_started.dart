import 'package:flutter/material.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';

class GetStartedOnboard extends StatelessWidget {
  final VoidCallback onPressed;
  const GetStartedOnboard({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
      
      color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(TSized.defaultSpace),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: onPressed,
                child: Text(
                  TTexts.getStarted,
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
          ),
        ),
      ),
    );
  }
}
