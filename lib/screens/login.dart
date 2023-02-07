import 'package:ecommerce/screens/home.dart';
import 'package:ecommerce/screens/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {

var emailController=TextEditingController();
var passController=TextEditingController();
var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,

      appBar:AppBar(


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
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,

validator: (String?val){
  if(val!.isEmpty){
    return "field must not be empty";
  }

  var regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if(!regex.hasMatch(val)){
    return "incorrect format";
  }
},
                    decoration: InputDecoration(
                      labelText: 'Email',
                      //labelStyle: TextStyle(color:Color(0xffabb9ff) ),
                      prefixIcon: Icon(Icons.email_rounded,color: Color(0xffabb9ff),),
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(20))
                    ),
                    cursorColor:Colors.black ,

                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: passController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,


               validator: (String? val){
        if(val==null){
              return "please enter a password";
              }
           else if(val.length < 6){
               return "password must be at least 6 characters";
  }
           return null;

                        },

                    decoration: InputDecoration(

                      labelText: 'Password',prefixIcon: Icon(Icons.lock,color: Color(0xffabb9ff),),
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(20)),
                      suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye,color: Color(0xffabb9ff),),onPressed: (){

                      },),


                    ),
                    cursorColor: Colors.black,
                  ),
                  SizedBox(height: 40,),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color:Color(0xffabb9ff) ,
                        borderRadius: BorderRadius.circular(30)

                    ),
                    child: MaterialButton(
                      onPressed: (){if(formKey.currentState!.validate()){

                        Navigator.push(context, MaterialPageRoute(builder: (build)=>home()),);


                      }

                      },child: Text('SIGN IN'),

                    ),

                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ?"),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (build)=>Signup()),);


                      }, child: Text('SIGN UP',style: TextStyle(color:Color(0xff634eff) ),)),

                    ],
                  )


                ],
              ),

          ),
        ),
      ),

    ) ;
  }
}
