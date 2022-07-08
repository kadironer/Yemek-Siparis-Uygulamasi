import 'package:flutter/material.dart';
import 'package:proje_yemek_siparis/yemekler.dart';

class DetaySayfa extends StatefulWidget {


  Yemekler yemek;
  DetaySayfa({required this.yemek});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}


class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.yemek.yemek_adi),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(widget.yemek.resim_adi),
            Text("${widget.yemek.fiyat} \u{20BA}",style: TextStyle(color: Colors.amber,fontSize: 48),),

            ElevatedButton(
              child: Text("Sipariş Ver"),
              onPressed:(){
                print("${widget.yemek.yemek_adi} Sipariş Verildi");
              },
            ),
          ],
        ),
      ),
    );
  }
}
