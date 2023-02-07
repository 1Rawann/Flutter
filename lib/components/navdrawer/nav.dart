import 'package:ecommerce/components/constance/color.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
backgroundColor:
      Colors.white,
      elevation: 8.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          Padding(
            padding: const EdgeInsetsDirectional.only(top:70),
            child: Column(
              children: [
                ListTile(

                  title: Text('Category 1',style: TextStyle(fontSize: 20),),
                  onTap: () => {},
                ),
                ListTile(

                  title: Text('Category 1',style: TextStyle(fontSize: 20),),
                  onTap: () => {},
                ),
                ListTile(

                  title: Text('Category 1',style: TextStyle(fontSize: 20),),
                  onTap: () => {},
                ),
                ListTile(

                  title: Text('Category 1',style: TextStyle(fontSize: 20),),
                  onTap: () => {},
                ),
                ListTile(

                  title: Text('Category 1',style: TextStyle(fontSize: 20),),
                  onTap: () => {},
                ),
                ListTile(

                  title: Text('Category 1',style: TextStyle(fontSize: 20),),
                  onTap: () => {},
                ),
                ListTile(

                  title: Text('Category 1',style: TextStyle(fontSize: 20),),
                  onTap: () => {},
                ),
                ListTile(

                  title: Text('Category 1',style: TextStyle(fontSize: 20),),
                  onTap: () => {},
                ),
                ListTile(

                  title: Text('Category 1',style: TextStyle(fontSize: 20),),
                  onTap: () => {},
                ),
                ListTile(

                  title: Text('Category 1',style: TextStyle(fontSize: 20),),
                  onTap: () => {},
                ),
                ListTile(

                  title: Text('Category 1',style: TextStyle(fontSize: 20),),
                  onTap: () => {},
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
