import 'package:notetakingapp/services/sharedprefrencesfunctions.dart';

import 'dart:convert';

class HelperFunctions{
  void saveNotes (bool hasIndex,Map<String, String> notesToSave, [index]) async {
    String? notes = await Sharedprefrencesfunction.getSharedPrefrencesNotes();

    if(notes !=null){
    List<dynamic>  decodeNotes = json.decode(notes);

    if(hasIndex){
      print('+++ $index');
      decodeNotes.removeAt(index);
      decodeNotes.insert(index, notesToSave);
    }else{
      decodeNotes.add(notesToSave);
    }

    

    String finalNotes = json.encode(decodeNotes);

    Sharedprefrencesfunction.saveSharedPrefrencesNotes(finalNotes);

    }else{

      var notes2 = json.encode([notesToSave]);
      Sharedprefrencesfunction.saveSharedPrefrencesNotes(notes2);
    }

  }

  void deleteAllNotes(){
    Sharedprefrencesfunction.saveSharedPrefrencesNotes("[]");
  }

  dynamic validator(var val){
    if(val==''){
      return "You can't left this field empty";
    }else{
      return null;
    }

  }
}