import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  var formKey=GlobalKey<FormState>();
  var adminController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(

          backgroundColor: Colors.white,

          appBar:AppBar(
leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_outlined),onPressed: (){
  Navigator.pop(context);
},color: Colors.black,),

            backgroundColor: Colors.white60,
            elevation: 0.0,

          ) ,
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsetsDirectional.all(40),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/shop.png',width: 175,height: 175,),
                    SizedBox(height: 10,),
                    Image.asset('assets/images/name.png',width: 140,height:80,),
                    SizedBox(height: 30.0,),
                    TextFormField(
                      controller: adminController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,


                      validator: (String?val){
                        if(val!.isEmpty){
                          return "field must not be empty";
                        }
                        if(val!='1111'){
                          return 'Wrong code,Please try again';
                        }


                      },
                      decoration: InputDecoration(
                          labelText: 'Admin code',
                          //labelStyle: TextStyle(color:Color(0xffabb9ff) ),
                          prefixIcon: Icon(Icons.password,color: Color(0xffabb9ff),),
                          border: OutlineInputBorder(borderRadius:BorderRadius.circular(20))
                      ),
                      cursorColor:Colors.black ,

                    ),


                    SizedBox(height: 40,),
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                          color:Color(0xffabb9ff) ,
                          borderRadius: BorderRadius.circular(30)

                      ),
                      child: MaterialButton(
                        onPressed: (){
                          String s=adminController.text;
                          if(formKey.currentState!.validate()){

                          Navigator.pushNamed(context, '/admin');

                        }

                        },child: Text('SIGN IN'),

                      ),

                    ),
                    SizedBox(height: 10,),


                  ],
                ),

              ),
            ),
          ),

        );
  }
}
