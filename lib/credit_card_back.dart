import 'package:flutter/material.dart';

class CreditCardBack extends StatelessWidget {
  const CreditCardBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * .9,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: LayoutBuilder(
        builder: (_, constrains) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                color: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 60,
                    width: constrains.maxWidth * .8,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 30,
                    width: constrains.maxWidth * .2,
                    color: Colors.white,
                    child: const Center(
                      child: Text('***'),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
