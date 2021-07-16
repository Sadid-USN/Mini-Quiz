import 'package:biz_card/utilite/hexcolor.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

import 'models/questions.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

int _currentQuestionIndex = 0;

class _QuizState extends State<Quiz> {
  List questions = [
    Question(
        '9 сентября 1991 года на сессии Шурои Оли Республики Таджикистан (Верховного Совета Республики Таджикистан) было принято Постановление и Заявление «О государственной независимости Республики Таджикистан»',
        true),
    Question(
        '27 июня 1997 года в Кремле на девятой по счёту встрече между представителями противоборствующих сторон (Правительством РТ и Объединённой таджикской оппозицией) при посредничестве ООН было подписано окончательное мирное соглашение.',
        true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('True Citizen'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'images/flagTj.png',
                height: 250,
                width: 280,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                        color: Colors.white, style: BorderStyle.solid)),
                height: 230.0,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    questions[_currentQuestionIndex].questionText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.green),
                  child: Center(
                    child: BouncingWidget(
                      scaleFactor: 1.5,
                      onPressed: () {
                        _checkAnswer(true);
                      },
                      duration: Duration(milliseconds: 100),
                      child: Text(
                        'TRUE',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.green),
                  child: Center(
                    child: BouncingWidget(
                      scaleFactor: 1.5,
                      onPressed: () { _checkAnswer(false);},
                      duration: Duration(milliseconds: 100),
                      child: Text(
                        'FALSE',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.green.shade400),
                    child: BouncingWidget(
                        onPressed: () {
                          _nextQuestion();
                        },
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white70,
                          size: 30,
                        )))
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice) {
    if (userChoice == questions[_currentQuestionIndex].isCorrect) {
      // correct answer
      debugPrint('Great your answer is correct');
    }else{
      debugPrint('Youre answer is wrong');
    }
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questions.length;
    });
  }
}

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercantage = 0;
  int _personCounter = 0;
  double _billAmounth = 0.0;

  Color _purple = HexColor('#6908d6');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          alignment: Alignment.center,
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(18.0),
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    color: _purple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Per Person',
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.normal,
                            fontSize: 20),
                      ),
                      Text(
                        '\$ ${calculateTotalPerPerson(_billAmounth, _personCounter, _tipPercantage)}',
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 34.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      width: 1.0,
                      color: Colors.blueGrey,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                  children: [
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(color: _purple, fontSize: 19),
                      decoration: InputDecoration(
                        prefixText: 'Bill Amounth',
                        //  prefixIcon: Icon(Icons.attach_money)
                      ),
                      onChanged: (String value) {
                        try {
                          _billAmounth = double.parse(value);
                        } catch (exception) {
                          _billAmounth = 0.0;
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Split',
                            style: TextStyle(color: Colors.grey.shade700)),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (_personCounter > 1) {
                                    _personCounter--;
                                  } else {}
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: _purple.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(7.0)),
                                child: Center(
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: _purple),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '$_personCounter',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: _purple),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _personCounter++;
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: _purple.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(7.0)),
                                child: Center(
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: _purple),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    //TIP

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tip',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                              '\$ ${(calculateTotalTip(_billAmounth, _personCounter, _tipPercantage)).toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: _purple)),
                        )
                      ],
                    ),
                    // Slider
                    Column(
                      children: [
                        Text('$_tipPercantage%',
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: _purple)),
                        Slider(
                            min: 0,
                            max: 100,
                            activeColor: _purple,
                            divisions: 10,
                            inactiveColor: Colors.grey,
                            value: _tipPercantage.toDouble(),
                            onChanged: (double value) {
                              setState(() {
                                _tipPercantage = value.round();
                              });
                            })
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  calculateTotalPerPerson(double billAmounth, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmounth, splitBy, tipPercentage) +
                tipPercentage +
                billAmounth) /
            splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quote = [
    'Ҳунар ба чашми адоват бузургтар айб аст,\n Гул аст Саъдию дар чашми душманон хор аст ',
    'Нури гетифрӯзи чашмаи хӯр,\n Зишт бошад ба чашми мушаки кӯр ',
    'Магӯй андуҳи хеш бо душманон,\n Ки "лоҳавл" гӯянд шодикунон ',
    'Он кас, ки ба Қуръону хабар з-ӯ нараҳӣ,\n Он аст ҷавобаш, ки ҷавобаш надиҳи',
    'Касе к-ӯ хирадро надорад зи пеш,\n Дилаш гардад зи кардаи хеш реш',
    'Ҳамеша хирадро ту дастур дор. \n Бад-ӯ ҷонат аз носазо дур дор',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 200,
                width: 370,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [Colors.pink.shade300, Colors.blue.shade600],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    quote[_index % quote.length],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 130,
                child: MaterialButton(
                  height: 40,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Colors.green.shade400,
                  onPressed: () {
                    setState(() {
                      _index += 1;
                    });
                  },
                  child: Text(
                    'Иқтибос',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BizCard extends StatefulWidget {
  @override
  _BizCardState createState() => _BizCardState();
}

class _BizCardState extends State<BizCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.withOpacity(.7),
          title: Text(
            'BizCard',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [_getCard(), _getAvatar()],
          ),
        ));
  }
}

Container _getAvatar() {
  return Container(
    child: CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage('https://source.unsplash.com/random'),
    ),
  );
}

Container _getCard() {
  return Container(
      margin: EdgeInsets.only(top: 60),
      height: 200,
      width: 350,
      decoration: BoxDecoration(
          color: Colors.pink.shade400,
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Paulo Dicgone',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
          ),
          Text(
            'buildappswithpaulo.com',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.perm_identity,
                    size: 26,
                  )),
              Text(
                'T: @buildappswithpaulo',
                style: TextStyle(
                  fontSize: 22,
                ),
              )
            ],
          )
        ],
      ));
}
