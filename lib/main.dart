import 'package:flutter/material.dart';
import 'package:proje_yemek_siparis/detaySayfa.dart';
import 'package:proje_yemek_siparis/yemekler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yemekler',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Yemekler'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Yemekler>> yemekleriGetir()async{
    var yemekListesi=<Yemekler>[];

    var y1=Yemekler(1, "Köfte", "images/kofte.png", 27.0);
    var y2=Yemekler(2, "Ayran", "images/ayran.png", 8.0);
    var y3=Yemekler(3, "Baklava", "images/baklava.png", 65.0);
    var y4=Yemekler(4, "Makarna", "images/makarna.png", 24.0);
    var y5=Yemekler(5, "Kadayıf", "images/kadayif.png", 18.0);
    var y6=Yemekler(6, "Fanta","images/fanta.png", 13.0);

    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);

    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var yemekListesi=snapshot.data;
            return ListView.builder(
              itemCount: yemekListesi!.length,
              itemBuilder: (context,indeks){
                var yemek=yemekListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetaySayfa(yemek: yemek,)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 150,
                            height: 150,
                            child: Image.asset("${yemek.resim_adi}")),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(yemek.yemek_adi, style: TextStyle(color: Colors.black54,fontSize: 25),),
                            SizedBox(height: 50,),
                            Text("${yemek.fiyat} \u{20BA}",style: TextStyle(color: Colors.amber,fontSize: 25),)
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                );
              }
            );
          }else{
            return Center();
          }
        },
      )
    );
  }
}
