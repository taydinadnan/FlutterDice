// import 'dart:math';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(home: DiceRollerScreen()));
// }

// class DiceRollerScreen extends StatefulWidget {
//   const DiceRollerScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _DiceRollerScreenState createState() => _DiceRollerScreenState();
// }

// class _DiceRollerScreenState extends State<DiceRollerScreen> {
//   int dice1 = 1;
//   int dice2 = 1;
//   int sum = 2;

//   void rollDice() {
//     setState(() {
//       dice1 = Random().nextInt(6) + 1;
//       dice2 = Random().nextInt(6) + 1;
//       sum = dice1 + dice2;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: rollDice,
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AnimatedSwitcher(
//                     duration: const Duration(milliseconds: 500),
//                     child: Row(
//                       key: ValueKey<int>(dice1),
//                       children: <Widget>[
//                         DiceWidget(value: dice1),
//                         const SizedBox(width: 16.0),
//                         DiceWidget(value: dice2),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20.0),
//               if (sum != 0)
//                 Text(
//                   '$sum',
//                   style: const TextStyle(fontSize: 30),
//                 ),
//               const SizedBox(height: 20.0),
//               TextButton(
//                 onPressed: rollDice,
//                 child: const Text('Tab anywhere to Roll Dice!'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DiceWidget extends StatelessWidget {
//   final int value;

//   const DiceWidget({super.key, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100.0,
//       height: 100.0,
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Center(
//         child: Text(
//           '$value',
//           style: const TextStyle(
//             fontSize: 48.0,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: DiceRollerScreen()));
}

class DiceRollerScreen extends StatefulWidget {
  const DiceRollerScreen({super.key});

  @override
  _DiceRollerScreenState createState() => _DiceRollerScreenState();
}

class _DiceRollerScreenState extends State<DiceRollerScreen> {
  int dice1 = 1;
  int dice2 = 1;
  int sum = 2;

  void rollDice() {
    setState(() {
      dice1 = Random().nextInt(6) + 1;
      dice2 = Random().nextInt(6) + 1;
      sum = dice1 + dice2;
    });
  }

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/cool-background.png';
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(
            imagePath,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector(
        onTap: rollDice,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: Row(
                        key: ValueKey<int>(dice1),
                        children: <Widget>[
                          DiceImage(value: dice1),
                          const SizedBox(width: 16.0),
                          DiceImage(value: dice2),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                if (sum != 0)
                  Text(
                    '$sum',
                    style: const TextStyle(fontSize: 30),
                  ),
                const SizedBox(height: 20.0),
                TextButton(
                  onPressed: rollDice,
                  child: const Text('Tap anywhere to Roll Dice!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DiceImage extends StatelessWidget {
  final int value;

  const DiceImage({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/dice$value.png';

    return Image.asset(
      imagePath,
      width: 100.0,
      height: 100.0,
    );
  }
}
