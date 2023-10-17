// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Project1(),
    );
  }
}

class Project1 extends StatefulWidget {
  const Project1({super.key});

  @override
  State<Project1> createState() => _Project1State();
}

class _Project1State extends State<Project1> {
  List mohamed = [
    {
      "line1": "بسم الله الرحمن الرحيم ",
      "line2": "الحمد لله رب العالمين ",
    },
    {"line1": "الرحمن الرحيم", "line2": " مالك يوم الدين"},
    {"line1": "اياك نعبد واياك نستعين", "line2": "اهدنا الصراط المستقيم"},
    {
      "line1": "صراط الذين انعمت عليهم غير المغضوب عليهم ولا الضالين",
      "line2": "",
    },
  ];
  int myindex = 0; //  تعريف مدخل

  fun(String dirction) {
    //  اسم الفونكشون وله قيمة متغيره
    switch (dirction) {
      //  وضع القيمة المتغيرة
      case "right": //  تحديد القيمة الاولي
        setState(() {
          if (myindex == 0) {
            //  لو العنصر = صفر
            myindex = mohamed.length -
                1; //  لتحديد اخر انديكس في الليست ثم نطرح واحد لان اللينس تبدا من 1 والانديكس يبدا من 0
          } else {
            myindex--; //  ينقص المتغير 1
          }
        });

        break;

      case "left": //  تحديد القيمة الثانية
        setState(() {
          //  لعمل هوت ريفريش
          if (myindex == mohamed.length - 1) {
            //  لتحديد اخر انديكس في الليست ثم نطرح واحد لان اللينس تبدا من 1 والانديكس يبدا من 0
            myindex = 0; //  لجعل المتغير بصفر لعدم حدوث خطاء
          } else {
            myindex++; // يزيد المتغير 1
          }
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                mohamed[myindex][
                    "line1"], // كتابة اسم الليست ثم الاانديكس ثم كتابة اسم مفتاح السطر
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center, //  لجعل بداية الكلام في المنتصف
                overflow: TextOverflow.clip,
                textDirection: TextDirection.rtl),
            Text(mohamed[myindex]["line2"]),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  //  لعمل زر
                  onPressed: () {
                    fun("right"); // استدعاء فونكشون مع كتابة الديركشون
                  },
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.arrow_left,
                    size: 66,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                    fun("left"); // استدعاء فونكشون مع كتابة الديركشون
                  },
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.arrow_right,
                    size: 66,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
