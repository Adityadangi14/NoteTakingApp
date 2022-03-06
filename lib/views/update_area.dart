import 'package:flutter/material.dart';
import 'package:notetakingapp/services/helper_functions.dart';
import 'package:notetakingapp/views/helperwidgets.dart';
import 'package:notetakingapp/views/homepage.dart';

class UpdateArea extends StatefulWidget {
 final int index;
 final String title;
 final String note;
    UpdateArea({ 
     required this.index, 
     required this.title, 
     required this.note}) ;

  @override
  State<UpdateArea> createState() => _UpdateAreaState();
}

class _UpdateAreaState extends State<UpdateArea> {


     HelperWidgets helperWidgets = HelperWidgets();

     HelperFunctions helperFunctions = HelperFunctions();

     TextEditingController titleTextEditingController = TextEditingController();

     TextEditingController noteTextEditingController = TextEditingController();

     final formKey = GlobalKey<FormState>();

     @override
     initState(){
       titleTextEditingController.text = widget.title;
       noteTextEditingController.text = widget.note;
       super.initState();
     }

     

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(5, 20, 10, 0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (val){
                  return helperFunctions.validator(val);
                },
                controller: titleTextEditingController,
                decoration: helperWidgets.inputdecoration('title'),
                keyboardType: TextInputType.multiline,
                maxLines: null
              ),
              Expanded(
                child: 
                TextFormField(
                  validator: (val){
                  return helperFunctions.validator(val);
                },
                  controller: noteTextEditingController,
                  decoration: helperWidgets.inputdecoration('Note'),
                  keyboardType: TextInputType.multiline,
                  maxLines: null
                )),
                ElevatedButton(onPressed: (){}, child: SizedBox(
                  width: 100,
                  child: InkWell(
                    onTap: (){
                      var notesToSave = {
                        "title":titleTextEditingController.text,
                        "note":noteTextEditingController.text
                      };
                      helperFunctions.saveNotes(true, notesToSave,widget.index);
        
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex)=> Homepage()));
                    },
                    child: Row(children:  const [
                      Icon(Icons.arrow_circle_up),
                      Text("  Update")
                    ],),
                  ),
                ))
            ],
          ),
        ),
      )
    );
  }
}