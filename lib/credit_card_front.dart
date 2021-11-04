import 'package:flutter/material.dart';

class CreditCardFront extends StatelessWidget {
  const CreditCardFront({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * .9,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            '4444 4444 4444',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'Valid \n thru',
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
              Text(
                '12/22',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Rodrigo Rahman',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
