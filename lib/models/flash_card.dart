import 'package:biz_card/models/flach_card_view.dart';
import 'package:biz_card/models/flash_card_quiz.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FlashCard extends StatefulWidget {
  FlashCard({Key? key}) : super(key: key);

  @override
  _FlashCardState createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  List<FlashCardQuiz> _flashcards = [
    FlashCardQuiz(
        question: 'How did Earth and other planets form?',
        answer:
            'Scientists are perplexed by how and why the planets formed into such distinct bodies, with only our rocky orb supporting life (as far as we know).'),
    FlashCardQuiz(
        question:
            'What happened during Earth\'s Dark Age, or the first 500 million years after it formed?',
        answer:
            'Understanding Earth\'s early development would explain how the atmosphere and oceans developed. One difficulty: Few rocks from then are preserved, meaning little concrete evidence.'),
    FlashCardQuiz(
        question: 'How did life begin?',
        answer:
            'In addition to rocks and minerals here, scientists are also probing Mars, where the sedimentary record of early planetary history predates the oldest Earth rocks.'),
    FlashCardQuiz(
        question:
            'How does Earth\'s interior work, and how does it affect the surface?',
        answer:
            'Scientists want to figure out more about the past and future of the constant convective motion of Earth\'s mantle and core, which triggers volcanism, mountain building and seafloor formation.'),
    FlashCardQuiz(
        question: 'Why does Earth have plate tectonics and continents? ',
        answer:
            'Scientists wonder why Earth has plates, constantly on the move, and how closely tectonics are related to the abundance of water, continents, oceans and life.'),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: FlashCardView(
                    text: _flashcards[_currentIndex].question,
                  ),
                  back: FlashCardView(
                    text: _flashcards[_currentIndex].answer,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 4, primary: Colors.white),
                    onPressed: showPrewviousCard,
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                      size: 30,
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 4, primary: Colors.white),
                    onPressed: showNextCard,
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                      size: 30,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          (_currentIndex  + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPrewviousCard() {
      setState(() {
      _currentIndex =
          (_currentIndex  - 1 >= 0 ) ? _currentIndex - 1 : _flashcards.length -1;
    });

  }
}
