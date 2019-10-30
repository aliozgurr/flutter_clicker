import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Clicker Denemesi'),
      
    );
  }
}
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('**SAYFA DEĞİŞTİRİRSEN PUANLARIN SIFIRLANIR****SAYFA DEĞİŞTİRİRSEN PUANLARIN SIFIRLANIR****SAYFA DEĞİŞTİRİRSEN PUANLARIN SIFIRLANIR**'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Ana Sayfa'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            ListTile(
              title: Text('Oyun Hakkında'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
              },
            ),
          ],
        )
      ),
      appBar: AppBar(
        title: Text('Clicker Denemesi'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Artıya tıklayaran puan topla.'),
            Text('100 puan karşılığında ev al.'),
            Text('400 puan karşılığında büyük ev al.'),
            Text('Ev saniyede 1 puan verir.'),
            Text('Büyük ev saniyede 5 puan verir.'),
            Text('40 saniyede bir bütün evlerin ikiye katlanır.'),
            Text(''),
            Text(''),
            Text(''),
            Text(''),
            Text('2019, Ali Özgür'),
          ],
        ),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _ev = 0;
  int _toplanan = 0;
  int _buyukEvSayi = 0;
  int _sure = 40;

  @override void initState() {
    super.initState();
    main();
    main2();
    main3();
    setState(() {
    });
  }

  void _incrementCounter() {// Eklemeler sürekli tekrar çağrıldığı için bunları ayrı bir voide almamız gerek
    setState(() { //Tekrar çağrılmasını sağlayan komut
      _counter++;
    });
  }
  void _otoArttiran(){
    setState(() {
      _toplanan = _ev * 1;
    });
  }
  void _malikaneArttiran(){
    setState(() {
     _toplanan = _buyukEvSayi * 5; 
    });
  }
  void _sureArttiran(){
    setState(() {
     _sure--; 
    });
  }
  void _evKontrol(){
    setState(() {
     if (_counter >= 100) {
       _ev++;
       _counter -= 100;
     }   
     else{
       showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Yetersiz Skor"),
          content: new Text("Bu işlem için en az 100 skora ihtiyacınız var."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Kapat"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ); 
      },
    );
     }
    });
  }
  void _malikane(){
      setState(() {
       if (_counter >= 400){
        _buyukEvSayi++;
        _counter -= 400;
       } 
       else{
       showDialog(
       context: context,
       builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Yetersiz Skor"),
          content: new Text("Bu işlem için en az 400 skora ihtiyacınız var."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Kapat"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
     }
      });
    }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('**SAYFA DEĞİŞTİRİRSEN PUANLARIN SIFIRLANIR****SAYFA DEĞİŞTİRİRSEN PUANLARIN SIFIRLANIR****SAYFA DEĞİŞTİRİRSEN PUANLARIN SIFIRLANIR**'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Ana Sayfa'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            ListTile(
              title: Text('Oyun Hakkında'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
              },
            )
          ],
        )
      ),
        appBar: AppBar(
          title: Text('Clicker Denemesi'),
        ),        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Skor:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1, // Anlık skoru kalın göstern
              ),              
              Text(
                'Ev Sayısı:',
              ),
              Text(
                '$_ev',
              ),
              Text(
                'Büyük Ev Sayısı',
              ),
              Text(
                '$_buyukEvSayi',
              ),
              Text(
                'Bonusa Kalan Süre:',
              ),
              Text(
                '$_sure',
              ),
              OutlineButton( // Büyük button
                  onPressed: () => _incrementCounter(),   // Ayrı bi void yazmamak için fat işaret kullanıyoruz
                  splashColor: Colors.transparent,
                  child: Container(
                      width: 1000, // Ayarlamazsanız küçük oluyor
                      height: 470,
                      
                      child: Icon(Icons.add, size:100)
                  )
              )
            ],
          ),
        ), 

        floatingActionButton: Row( //Yan yana düğme yazmak için Row gerek
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FloatingActionButton( //Düz ufak butonlar
              heroTag: "btn1",
              onPressed: _evKontrol,
              child: Icon(Icons.home),
            ),
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: _malikane,
              child: Icon(Icons.brightness_1))
          ],
        )
    );
  }

  main() async{
    Timer.periodic(Duration(seconds: 1), (_) {
      _otoArttiran();
      _counter += _toplanan;
    });
  }
    main2() async{
    Timer.periodic(Duration(seconds: 1), (_) {
      _malikaneArttiran();
      _counter += _toplanan;
    });
  }
    main3() async{
      if(_sure != 0){
        Timer.periodic(Duration(seconds: 1), (_){
          _sureArttiran();
          if(_sure == 0){ 
            _ev *= 2;
            _buyukEvSayi *= 2;
            _sure = 40;             
          }
      });
      }
    }
}
