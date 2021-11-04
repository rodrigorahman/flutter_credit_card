import 'package:flutter/material.dart';
import 'dart:math';

import 'package:virando_cartao/card_animation.dart';
import 'package:virando_cartao/credit_card_front.dart';

import 'credit_card_back.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _frontRotation;
  late Animation<double> _backRotation;
  bool isFrontVisible = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _setupCardAnimation();
  }

  void _setupCardAnimation() {
    bool rotateToLeft;
    if (isFrontVisible) {
      rotateToLeft = true;
    } else {
      rotateToLeft = false;
    }
    print(pi / 2);
    _frontRotation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
                  begin: 0.0, end: rotateToLeft ? (pi / 2) : (-pi / 2))
              .chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(rotateToLeft ? (-pi / 2) : (pi / 2)),
          weight: 50.0,
        ),
      ],
    ).animate(controller);

    ///Initialize the Back to Front rotation tween sequence.
    _backRotation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(rotateToLeft ? (pi / 2) : (-pi / 2)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
                  begin: rotateToLeft ? (-pi / 2) : (pi / 2), end: 0.0)
              .chain(
            CurveTween(curve: Curves.linear),
          ),
          weight: 50.0,
        ),
      ],
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            CardAnimation(
              animation: _backRotation,
              child: const CreditCardBack(),
            ),
            CardAnimation(
              animation: _frontRotation,
              child: const CreditCardFront(),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            setState(() {
              if (isFrontVisible) {
                controller.forward();
                isFrontVisible = false;
              } else {
                controller.reverse();
                isFrontVisible = true;
              }
            });
          },
          child: const Text('Vira'),
        ),
      ],
    );
  }
}
