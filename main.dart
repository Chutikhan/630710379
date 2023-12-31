import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funny Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
   static List<Color> colors =[
     Colors.teal,
     Colors.pinkAccent,
     Colors.lightGreenAccent,
     Colors.purpleAccent,
     Colors.red,
   ];
   var color = colors[0];


  static const List<String> quoteList = [
    'พร้อมจะหยุดเสมอ ถ้าเจอไฟแดง',
    'อย่าทำวันนี้ให้ดีที่สุด เดี๋ยวพรุ่งนี้ไม่มีอะไรทำ',
    'เป็นคนไม่ค่อยฝัน เพราะว่าฉันไม่ค่อยนอน',
    'รอคนไม่มีหัวใจ ก็เหมือนรอประชาธิปไตยจากรัฐบาล',
    'ถ้าคนจริง โอวัลตินต้องละลาย',
  ];
  var quote = quoteList[0];

  void handleClickGo() {
    setState(() {
      var rand = Random();
      var randomIndex = rand.nextInt(quoteList.length);
      quote = quoteList[randomIndex];

      var randomC = Random();
      var RandomC = randomC.nextInt(colors.length);
      color = colors[RandomC];
    });
  }


   @override
   Widget build(BuildContext context) {
    var rand = Random();
    var randomIndex = rand.nextInt(quoteList.length);
    var quote = quoteList[randomIndex];
     return Scaffold(
       appBar: AppBar(title: const Text('Funny Quotes')),
       floatingActionButton: FloatingActionButton(
         onPressed: handleClickGo,
         child: const Text('Next Quotes'),

       ),
       body: Center(
           child: Padding(
             padding: const EdgeInsets.all(32.0),
             child: Text(
               quote,
               style:  TextStyle(
                   color: color,
                   fontSize: 50,
                   fontStyle: FontStyle.italic,
                   fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,

             ),
           ),
       ),
     );
   }
}