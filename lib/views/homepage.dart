import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notetakingapp/services/helper_functions.dart';
import 'package:notetakingapp/services/sharedprefrencesfunctions.dart';
import 'package:notetakingapp/views/editarea.dart';
import 'package:notetakingapp/views/update_area.dart';

class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  HelperFunctions helperFunctions = HelperFunctions();

   @override
  void initState() {
   setState(() {
     
   });

    super.initState();
  }

  // late List<Map<String, String>> notes;

  // @override
  // void initState() async {
  //   // TODO: implement initState

  // String? notesString = await getNotes(); 

  // if(notesString != null) {
  //   notes = json.decode(notesString);
  // }
  //   super.initState();
  // }

  

  Future<List> getNotes() async{
    String? notesString =  await Sharedprefrencesfunction.getSharedPrefrencesNotes();

    print(notesString);
    if(notesString != null) {
    var notes = json.decode(notesString);
    return notes;
     }else{
       return [];
     }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('NoteTaking App'),
      actions:  [
        InkWell(
          onTap: (){
          helperFunctions.deleteAllNotes();
          setState(() {
            
          });
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.delete),
          ))
      ],),

      floatingActionButton: FloatingActionButton(
      onPressed: (){

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex)=> const EditArea()));
      },

      child: const Icon(Icons.add),
      ),

      body: FutureBuilder(
        future: getNotes() ,
        builder: (context,AsyncSnapshot<List> snapshot) {

          print("+++++++++++ $snapshot");

          

          if(snapshot.connectionState == ConnectionState.done){
            List? notes = snapshot.data;

            if(notes!.isEmpty){

            return const Center(
              child:  Text("opps!! You don't have any notes", style: TextStyle(fontSize: 22, color: Colors.grey)),
            );

          }else{
            
            return GridView.count(crossAxisCount: 2,

            padding: const EdgeInsets.all(5),
            
            children: List.generate(notes.length, (index)  {
               return Card(child: Container(

                  child: Column(
                    children: [
                      Container(
                        color: Colors.yellow.shade300,
                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(notes[index]['title'],
                            style: const TextStyle(fontWeight: FontWeight.bold
                            ,fontSize: 18,)),
                           InkWell(
                             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateArea(
                               index: index,
                               title: notes[index]["title"],
                               note:notes[index]["note"],
                               
                               ))),

                             child: const Icon(Icons.edit))
                          ],
                        ),

                       
                      ),
                       Padding(
                         padding: EdgeInsets.all(8),
                         child: Text(notes[index]["note"], 
                         maxLines: 3,
                         style: TextStyle(fontSize: 16)),
                       )
                    ],
                
                ),

               ),) ;

            }),
            
            );
          }

          }else{
            return const CircularProgressIndicator();
          }

          

         
          
          
        },
      ) ,

      
    );
  }
}



 