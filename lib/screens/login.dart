import 'package:ecommerce/Admin/admin.dart';
import 'package:ecommerce/Helperdp/databasehelper.dart';
import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/provider/home_provider.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:ecommerce/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
var emailController=TextEditingController();
bool isClicked=false;
bool pass=false;
bool em=false;
var passController=TextEditingController();

var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                      if(!em){
                        return"Email doesn't exist";
                      }
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
                    obscureText: isClicked?false:true,


               validator: (String? val){

                      if(!pass){
                        return'Incorrect Password';
                      }

        if(val!.isEmpty){
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
                      suffixIcon: IconButton(icon: Icon(isClicked?Icons.visibility_off_sharp:Icons.visibility),color: Color(0xffabb9ff)
                        ,onPressed: (){

setState(() {
  isClicked=!isClicked;
});
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
                      onPressed: () async {
String emailVal=emailController.text;
String passVal=passController.text;
bool success = await DatabaseHelper.isUserPresent(emailVal, passVal);
if(success){
  pass=true;
  em=true;
  if(formKey.currentState!.validate()){

    Navigator.pushNamed(context, '/Home');

  }


}
else
  {
    if(formKey.currentState!.validate());
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
                  ),
                  TextButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (build)=>Admin()));



                  }, child: Text('LOGIN AS ADMIN',style: TextStyle(color:Color(0xff634eff) ),)),



                ],
              ),

          ),
        ),
      ),

    ) ;
  }
}
