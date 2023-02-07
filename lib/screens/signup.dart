import 'package:ecommerce/Helperdp/databasehelper.dart';
import 'package:ecommerce/models/usermodel.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var formKey=GlobalKey<FormState>();

  var NameController=TextEditingController();

  var emailController=TextEditingController();

  var passController=TextEditingController();

  var phoneNoController=TextEditingController();
bool isClicked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(

leading:IconButton(icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,), onPressed: () { Navigator.pop(context);},),
        backgroundColor: Colors.white60,
        elevation: 0.0,

      ) ,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsetsDirectional.all(30),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/shop.png',width: 120,height: 120,),

                Image.asset('assets/images/name.png',width: 100,height:80,),
                SizedBox(height: 10.0,),
                TextFormField(
                  controller: NameController,
                  keyboardType: TextInputType.text,



                  validator: (String? val){
                    if(val!.isEmpty){
                      return "field must not be empty";
                    }

                   return null;

                  },

                  decoration: InputDecoration(

                    labelText: 'Full Name ',prefixIcon: Icon(Icons.account_circle,color: Color(0xffabb9ff),),
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(20)),



                  ),
                  cursorColor: Colors.black,
                ),


                SizedBox(height: 20,),
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
                SizedBox(height: 20,),
                TextFormField(
                  controller: phoneNoController,
                  keyboardType: TextInputType.phone,



                  validator: (String? val){
                    if(val!.isEmpty){
                      return "please enter a phone NO";
                    }
                    else if(val.length != 11){
                      return "Phone No. must be 11 digits";
                    }
                    return null;

                  },

                  decoration: InputDecoration(

                    labelText: 'Phone',prefixIcon: Icon(Icons.phone_android,color: Color(0xffabb9ff),),
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(20)),



                  ),
                  cursorColor: Colors.black,
                ),

                SizedBox(height: 40,),
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                      color:Color(0xffabb9ff) ,
                      borderRadius: BorderRadius.circular(30)

                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      String name = NameController.text;
                      String email = emailController.text;
                      String pass = passController.text;
                      String phoneNo=phoneNoController.text;

                      User user = new User(name:name,email: email,password: pass,phoneNo: phoneNo) ;

                      if(formKey.currentState!.validate()){
                        DatabaseHelper.addUser(user);
                        Navigator.popAndPushNamed(context, '/Home');
                      }

                    },child: Text('Create an account'),

                  ),

                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("OR"),
                    TextButton(onPressed: (){

Navigator.pop(context);
                    }, child: Text('LOGIN TO YOUR ACCOUNT',style: TextStyle(color:Color(0xff634eff) ),)),

                  ],
                )


              ],
            ),

          ),
        ),
      ),

    );
  }
}
