import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/dialog/dialog.dart';
import 'package:ecommerce/models/item_model.dart';
import 'package:ecommerce/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class  AdminHome extends StatefulWidget {


  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).getItemsFromDB();
    super.initState();
  }
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: true);
    var products{

    };
    return WillPopScope(onWillPop:()async{
return false;

    },
      child: Scaffold(
      appBar: AppBar(
      backgroundColor: defaultColor,

      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Item? item = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddItemDialog();
              },
            );
            if(item==null){}
            else{
            provider.addItem(item);}
          },
          child: Icon(Icons.add),
          backgroundColor: defaultColor,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => Column(
            children: [
              Card(
                color: Colors.green[50],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)) ,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          image:  DecorationImage(
                            image: NetworkImage(
                                products[index]['image']),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Column(
                        children: [
                          Text('${products[index]['name']}',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('${products[index]['price']}LE',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    products[index]['weight'] +=0.5;
                                    setState(() {});
                                  },
                                  backgroundColor: Colors.green,
                                  child: const Icon(
                                    Icons.add,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('${products[index]['weight']}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {products[index]['weight'] -=0.5;
                                    if(products[index]['weight']<0){
                                      products[index]['weight']=0;
                                    }
                                    });},
                                  backgroundColor: Colors.red,
                                  child: const Icon(
                                    Icons.minimize,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
          itemCount: products[].length,
        ),,
      ),
    );
  }
}
