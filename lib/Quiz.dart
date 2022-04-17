import 'package:biz_card/ui/colors.dart';
import 'package:biz_card/utilite/hexcolor.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models/questions.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

int _currentQuestionIndex = 0;

class _QuizState extends State<Quiz> {
  List questions = [
    Question(
      'Таджики — один из самых древних народов на планете. Тысячу лет до н. э. на территории страны существовали весьма развитые государства — Бактрия и Согд. Позже они попадали под власть многочисленных империй: персов, Александра Македонского, Селевкидов и Саманидов — и так до самого конца 20 века. В итоге самостоятельное государство у таджиков появилось только в 1991 г.',
      true,
    ),
    Question(
      'Ибн Сина, отец персидской поэзии Рудаки, философ Омар Хайям, величайший иранский поэт Фирдауси — являются предками современных таджиков.',
      true,
    ),
    Question(
      'В Таджикистане привлекают к уголовной ответственности граждан, которые не знают хотя бы пару строк из таджикской поэзии',
      false,
    ),
    Question(
      'Таджикистан (тадж. Тоҷикистон), официальное название — Респу́блика Таджикиста́н (тадж. Ҷумҳурии Тоҷикистон, перс.\n (جمهوری تاجیکستان‎) — государство в Центральной Азии, расположенное в предгорьях Памира и не имеющее выхода к морю',
      true,
    ),
    Question(
      'Одно из крупнейших в мире месторождений серебра находится на севере Таджикистана.',
      true,
    ),
    Question(
      'Первые государственные образования на современной территории Таджикистана появились ещё до нашей эры, назывались они Бактрия и Согдиана.',
      true,
    ),
    Question(
      'Численность населения Таджикистана на 1 января 2021 года составила 9 млн. 504 тыс. человек. По темпу роста населения за 30 лет Таджикистан занял первое место среди республик бывшего СССР.',
      true,
    ),
    Question(
      'Площадь Таджикистана 143 100 км²',
      true,
    ),
    Question(
        'Таджикистан  это наименьшее по площади государство Средней Азии. Граничит с Узбекистаном на западе и северо-западе, с Киргизией — на севере, с Китаем — на востоке, с Афганистаном — на юге?',
        true),
    Question(
        'Таджикистан — единственное персоязычное государство в бывшей советской Средней Азии. Большинство населения Таджикистана исповедует ислам суннитского толка.',
        true),
    Question(
        'Таджикистан богат природными ресурсами, но так как 93% территории республики занимают горы, их добыча затруднена слаборазвитой инфраструктурой. Таджикистан расположен вдали от основных евразийских транспортных потоков.',
        true),
    Question(
        'Со времён Ахеменидов название «Иран» (на таджикском — Эрон) закрепилось за государствами западно-иранских народов, создавших мощные централизованные империи. Erānšahr (Эроншаҳр) происходит от авестийского Airyānam Xšaθram. Авестийский дифтонг ai трансформировался в среднеперсидский гласный е. Восточно-иранские народы.',
        true),
    Question(
        'В Таджикистане есть потрясающе красивое озеро Искандеркуль («озеро Александра»), цвет воды в котором постоянно меняет оттенки.',
        true),
    Question(
        'Непосредственные предки таджиков, назвали свою землю «Туран» (на таджикском — Турон). Страна восточно-иранских народов — Туран — была политически раздроблена на 4 отдельных государства: Согд, Бактрия, Хорезм, Маргиана. Предками таджиков были также кочевые племена саков.',
        true),
    Question(
        'Условной границей между Ираном и Тураном в древние времена была сначала Сырдарья, а в более поздние времена — Амударья',
        true),
    Question(
        'Основной сток Амударьи формируется на территории Таджикистана (80 %) и частично в Северном Афганистане. Затем река протекает вдоль границы Афганистана с Узбекистаном, пересекает Туркмению и вновь возвращается в Узбекистан и впадает в Аральское море. В настоящее время воды реки не доходят до Аральского моря, так как забираются на орошение.',
        true),
    Question(
        'Первые государственные образования, существовавшие на территории современного Таджикистана — Бактрия и Согдиана, появившиеся ещё до начала нашей эры.',
        true),
    Question(
        'Баактрия (Бактриана от перс. باختر ; тадж. Балх, Бохтар) — историческая область, на сопредельных территориях современных Таджикистана, Узбекистана и Афганистана, между горной цепью Гиндукуш на юге и Ферганской долиной на севере.',
        true),
    Question(
        'Столицей страны был город Бактры на территории северного Афганистана. Бактрийцы говорили на вымершем бактрийском — иранском языке индо-иранской подгруппы индоевропейской языковой семьи',
        true),
    Question(
        'Индоевропе́йские языки́ — самая распространённая в мире языковая семья. Представлена на всех обитаемых континентах Земли, число носителей превышает 2,5 млрд. Согласно воззрениям некоторых современных языковедов, является частью макросемьи ностратических языков',
        true),
    Question('В Таджикистане один из лучших в мире интернет', false),
    Question(
        'Современные таджики, юг Таджикистана и север Афганистана являются потомками древних бактрийцев',
        true),
    Question(
      'Таджики чистично относятся к тюркскому народу.',
      false,
    ),
    Question(
      'ВВП на душу населения в Таджикистане занимает 157-ое место среди 189-и стран мира.',
      true,
    ),
    Question(
      'Таджикистан оказался в числе 33 беднейших стран мира.',
      true,
    ),
    Question(
      'Душанбе, столицу Таджикистана, можно назвать одним из самых красивых городов в Средней Азии.',
      true,
    ),
    Question(
      'За пределами Душанбе начинается совсем другой пейзаж — городки с домами из подручных материалов и горные кишлаки с минимумом достижений цивилизации, где до сих пор топят коровьим навозом.',
      true,
    ),
    Question(
      'В Таджикистане покупатель обязан торговаться, даже в фирменных магазинах с брендовой одеждой и смартфонами.',
      false,
    ),
    Question(
      'В Таджикистане — невероятно вкусные лимоны, фисташки и чай. Знающие путешественники называют их лучшими в мире и килограммами везут на родину.',
      false,
    ),
  ];

  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green[600]),
            overlayColor: MaterialStateProperty.all(Colors.white24)),
        onPressed: _updateQustion,
        child: Icon(
          Icons.update,
          size: 30,
          color: Colors.white,
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'images/flagTj.png',
                height: 150,
                width: 200,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                height: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://source.unsplash.com/random?tajikistan'),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  height: 380,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12.0),

                    //            gradient: LinearGradient(
                    // begin: Alignment.topCenter,
                    // end: Alignment.bottomCenter,
                    // colors: [
                    //   Color(0xFF295f48),
                    //   Color(0xFF204c39),
                    //   Color(0xFF18392b),
                    //   Color(0xFFdadae3),
                    // ],
                    // stops: [
                    //   0.1,
                    //   0.4,
                    //   0.7,
                    //   0.9
                    // ])
                  ),
                  child: ListView(
                      padding: EdgeInsets.all(20),
                      physics: ClampingScrollPhysics(),
                      children: [
                        Text(
                          questions[_currentQuestionIndex].questionText,

                          //textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _previousQuestion();
                  },
                  child: Container(
                    width: 80,
                    height: 50,
                    child: Icon(Icons.arrow_back,
                        size: 40,
                        color: darkMode ? Colors.white : Colors.black),
                    decoration: BoxDecoration(
                        color: darkMode ? Colors.grey[850] : Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  darkMode ? Colors.black54 : Colors.grey[500]!,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                          BoxShadow(
                              color:
                                  darkMode ? Colors.grey[800]! : Colors.white,
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                        ]),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _checkAnswer(true);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 50,
                    child: Text(
                      'Правда',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        color: darkMode
                            ? Colors.green[850]
                            : Colors.green.withOpacity(0.8),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        boxShadow: [
                          BoxShadow(
                              color: darkMode
                                  ? Colors.black54
                                  : Colors.blueGrey[500]!,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                          BoxShadow(
                              color:
                                  darkMode ? Colors.grey[800]! : Colors.white,
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                        ]),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _checkAnswer(false);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 50,
                    child: Text(
                      'Ложь',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        color: darkMode
                            ? Colors.green[850]
                            : Colors.red.withOpacity(0.7),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        boxShadow: [
                          BoxShadow(
                              color: darkMode
                                  ? Colors.black54
                                  : Colors.blueGrey[500]!,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                          BoxShadow(
                              color:
                                  darkMode ? Colors.grey[800]! : Colors.white,
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                        ]),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _nextQuestion();
                  },
                  child: Container(
                    width: 80,
                    height: 50,
                    child: Icon(Icons.arrow_forward,
                        size: 40,
                        color: darkMode ? Colors.white : Colors.black),
                    decoration: BoxDecoration(
                        color: darkMode ? Colors.grey[850] : Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  darkMode ? Colors.black54 : Colors.grey[500]!,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                          BoxShadow(
                              color:
                                  darkMode ? Colors.grey[800]! : Colors.white,
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                        ]),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice) {
    if (userChoice == questions[_currentQuestionIndex].isCorrect) {
      // correct answer

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          action: SnackBarAction(
            label: 'Скрыть',
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                _updateQustion();
              });
            },
          ),
          //padding: EdgeInsets.only(right: 10, left: 10),

          // behavior: SnackBarBehavior.floating,
          elevation: 8,
          backgroundColor: Colors.green.shade400,
          duration: Duration(seconds: 3),
          content: Text(
            'Правильно!',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: secondaryBackgroundWhite),
            textAlign: TextAlign.start,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          action: SnackBarAction(
            label: 'Скрыть',
            textColor: Colors.white,
            onPressed: () {},
          ),
          //behavior: SnackBarBehavior.floating,
          elevation: 8,
          backgroundColor: Colors.red.shade400,
          duration: Duration(seconds: 3),
          content: Text(
            'Неправильно!',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: secondaryBackgroundWhite),
            textAlign: TextAlign.start,
          ),
        ),
      );
    }
  }

  _updateQustion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questions.length;
    });
  }

  _nextQuestion() {
    setState(() {
      _updateQustion();
    });
  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questions.length;
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
