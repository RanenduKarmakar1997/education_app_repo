import 'package:flutter/material.dart';
import 'package:quiz_flutter/data/data.dart';
import 'package:quiz_flutter/screens/signin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _firstController = ScrollController();
  late String imageUrl = 'assets/images/photo_1.jpg';
  late int questionNo = 0;
  late String ques = 'abc';
  late String option1 = '1';
  late String option2 = '2';
  late String option3 = '3';
  late String option4 = '4';
  //List<Question> myQues = [];
  _nextButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            if (questionNo >= 0 && questionNo <= questionList.length - 2) {
              questionNo++;
              imageUrl = '${questionList[questionNo].image}';
              ques = '${questionList[questionNo].question}';
              option1 = '${questionList[questionNo].quesOption1}';
              option2 = '${questionList[questionNo].quesOption2}';
              option3 = '${questionList[questionNo].quesOption3}';
              option4 = '${questionList[questionNo].quesOption4}';
              print(questionNo);
            }
          });
        },
        child: Text('Next'));
  }

  _backButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            if (questionNo >= 0 && questionNo <= questionList.length - 1) {
              questionNo--;
              imageUrl = '${questionList[questionNo].image}';
              ques = '${questionList[questionNo].question}';
              option1 = '${questionList[questionNo].quesOption1}';
              option2 = '${questionList[questionNo].quesOption2}';
              option3 = '${questionList[questionNo].quesOption3}';
              option4 = '${questionList[questionNo].quesOption4}';
              print(questionNo);
            }
          });
        },
        child: Text('Back'));
  }

  _submitButton() {
    return TextButton(
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  content: Text('Are you sure want to Submit?'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Review')),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SigninScreen()));
                          });
                        },
                        child: Text('Submit')),
                  ],
                )),
        child: Text('Submit'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('T90'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.all(10.0),
            child: LinearProgressIndicator(
              value: 0.7,
              color: Colors.purple,
              backgroundColor: Colors.grey,
              minHeight: 10,
            ),
          ),
          Container(
            //padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                border: Border.all(width: 1.2, color: Colors.black)),
            height: MediaQuery.of(context).size.height / 2.5,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Row(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth / 5,
                      child: Scrollbar(
                        isAlwaysShown: true,
                        controller: _firstController,
                        child: ListView.builder(
                            controller: _firstController,
                            itemCount: questionList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    imageUrl = '${questionList[index].image}';
                                    questionNo = index;
                                    ques = '${questionList[index].question}';
                                    option1 =
                                        '${questionList[index].quesOption1}';
                                    option2 =
                                        '${questionList[index].quesOption2}';
                                    option3 =
                                        '${questionList[index].quesOption3}';
                                    option4 =
                                        '${questionList[index].quesOption4}';
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      //color: Colors.grey,
                                      border: Border.all(
                                          width: 1.2, color: Colors.black),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Q${index + 1}',
                                      //style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Image(
                          image: AssetImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(width: 1.2, color: Colors.black)),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Q${questionNo + 1} ' + ques,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(option1),
                            Text(option2),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(option3),
                            Text(option4),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          questionList[questionNo].id == 1
              ? Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(10.0),
                    child: _nextButton(),
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _backButton(),
                        questionList[questionNo].id == 13
                            ? _submitButton()
                            : _nextButton(),
                      ]),
                ),
        ],
      ),
    );
  }
}
