import "package:shared_preferences/shared_preferences.dart";



class Sharedprefrencesfunction{

  static String sharedPrefrencesNotes = 'NOTES';

  static Future<bool> saveSharedPrefrencesNotes(String notes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPrefrencesNotes, notes);
  }

   static Future<String?> getSharedPrefrencesNotes ()  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPrefrencesNotes);
  }

 
}