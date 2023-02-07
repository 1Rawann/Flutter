import 'package:ecommerce/screens/home.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  var formKey=GlobalKey<FormState>();
  var NameController=TextEditingController();
  var emailController=TextEditingController();
  var passController=TextEditingController();
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
                  obscureText: true,


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
                    suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye,color: Color(0xffabb9ff),),onPressed: (){

                    },),


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
                    onPressed: (){if(formKey.currentState!.validate()){

                      Navigator.push(context, MaterialPageRoute(builder: (build)=>home()),);


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
