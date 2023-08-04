import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class JournalEdit {
  String? action;
  Journal? journal;
  JournalEdit({this.action, this.journal});
}

class Journal {
  String? id;
  String? date;
  String? mood;
  String? note;

  Journal({this.id, this.date, this.mood, this.note});

  factory Journal.fromJson(Map<String, dynamic> json) => Journal(
        id: json["id"],
        date: json["date"],
        mood: json["mood"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "mood": mood,
        "note": note,
      };
}

class Database {

  List<Journal>? journal;

  Database({this.journal});

  factory Database.fromJson(Map<String, dynamic> json) {
    //3. El constructor usa los datos pasados para crear una instancia de la clase Database
    return Database(
        journal: List<Journal>.from(json["journals"].map((x) => x.toJson())));
  }

  Map<String, dynamic> toJson() => {
        "journals": List<dynamic>.from(journal!.map((x) => x.toJson())),
      };
}

class DatabaseFileRoutines {
  
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/local_persistence.json');
  }

  Future<String> readJournals() async {
    try {
      final file = await _localFile;

      if (!file.existsSync()) {
        print('File does not exist: {$file.absolute}');
        await writeJournals('{"journals": []}');
      }

      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      print('error readJournals: $e');
      return "";
    }
  }

  Future<File> writeJournals(String json) async {
    final file = await _localFile;

    return file.writeAsString('$json');
  }

  // To read and parse from JSON data - databaseFromJson(jsonString);
  Database databaseFromJson(String str) {
    final dataFromJson = json.decode(str);
    return Database.fromJson(dataFromJson);
  }

  // To save and parse to JSON Data - databaseToJson(jsonString);
  String databaseToJson(Database data) {
    final dataToJson = data.toJson();
    return json.encode(dataToJson);
  }
}
