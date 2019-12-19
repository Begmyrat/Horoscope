import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';
import 'package:flutter_burc_rehberi/models/burc.dart';

class BurcDetay extends StatefulWidget {
  int gelenIndex;

  BurcDetay(this.gelenIndex);

  @override
  BurcDetayState createState() {
    return new BurcDetayState();
  }
}

class BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color baskinRenk;

  @override
  void initState() {
    super.initState();
    secilenBurc = BurcListesi.tumBurclar[widget.gelenIndex];
    baskinRengiBul();
  }

  void baskinRengiBul() {
      setState(() {
        baskinRenk = Colors.red;
      });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: baskinRenk != null ? baskinRenk : Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/" + secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              title: Text(secilenBurc.burcAdi + " Burcu ve Özellikleri"),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(secilenBurc.burcDetayi,
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                      onPressed: (){
                        
                      },            
                      child: Icon(Icons.local_grocery_store, color: Color(0xFFeeeeee))
                      ),
                    ),
                  ],
                  
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
