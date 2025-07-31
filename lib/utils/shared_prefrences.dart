//TODO: Save last sura = write data
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKeys {
  static const String mostRecentKey = 'most_Recent';
}

void saveNewSuraList(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentIndicesList = prefs.getStringList(SharedPrefsKeys.mostRecentKey)??[];
  mostRecentIndicesList.add('${newSuraIndex}');
  await prefs.setStringList(SharedPrefsKeys.mostRecentKey, []);
}
//TODO: get sura List = read data