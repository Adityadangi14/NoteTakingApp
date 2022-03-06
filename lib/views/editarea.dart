// ignore_for_file: file_names
//ignore: flutter_lints

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notetakingapp/services/helper_functions.dart';
import 'package:notetakingapp/views/helperwidgets.dart';
import 'package:notetakingapp/views/homepage.dart'; 

class EditArea extends StatefulWidget {
  const EditArea({ Key? key }) : super(key: key);

  @override
  State<EditArea> createState() => _EditAreaState();
}

class _EditAreaState extends State<EditArea> {

  HelperFunctions helperFunctions = HelperFunctions();
  HelperWidgets helperWidgets = HelperWidgets();
  TextEditingController titleTextEditingController =  TextEditingController();

  TextEditingController noteTextEditingController =  TextEditingController();

  final formKey = GlobalKey<FormState>();

  

  @override
  void initState() {
    
    

    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    appBar: AppBar(),
     body:  Container(
       padding :const EdgeInsets.fromLTRB(10, 20, 10, 0),
        child:  Form(
          key: formKey,
          child: Column(children:  [
             TextFormField(
               
               validator: (val){
                 return helperFunctions.validator(val);
               },
              controller: titleTextEditingController,
              decoration: helperWidgets.inputdecoration('Title')
            ),
             Expanded(child: TextFormField(
               
               validator: (val){
                 return helperFunctions.validator(val);
               },
              controller: noteTextEditingController,
              decoration: helperWidgets.inputdecoration('Note'),
              maxLines: null, 
              keyboardType: TextInputType.multiline,
            )),
            SizedBox(
              width: 150,
              child: ElevatedButton(onPressed: (){
                if (formKey.currentState!.validate()){
                  helperFunctions.saveNotes(false,{
                 "title": titleTextEditingController.text, 
                 "note": noteTextEditingController.text
                 });
        
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Homepage()));
                }
                 
              }, child: Row(children: const [
                Icon(Icons.add),
                Text('Add Note')
              ],)),
            )
          ],),
        ),
      )

    );
  }
}