import "package:cloud_firestore/cloud_firestore.dart";
import "package:intl/intl.dart";
import "package:pluton_v2/services/firebase_notifications_services.dart";


FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getData() async {
  List data = [];
  CollectionReference collectionReferenceData = db.collection("Data");

  QuerySnapshot queryData = await collectionReferenceData.get();

  for (var element in queryData.docs) {
    data.add(element.data());
  }

  return data;
}

Future<void> addData(List<double> data, title) async {
  DateTime now = DateTime.now();

  await db.collection("Data").add({
    "ASOPROVIPAZ": data[1],
    "APORTE VOLUNTARIO": data[3],
    "APORTE CONGREGACIONAL": data[2],
    "DIEZMO DE DIEZMO": data[0],
    "SUMA DE APORTES": data[4],
    "NETO PASTORAL": data[5],
    "INGRESO TOTAL": data[6],
    "TITLE": title,
    "DATE": DateFormat('EEEE, MMMM d, y - hh:mm:ss a').format(now),
  });

  await sendNotification( "Nuevo aporte", "Se ha registrado un nuevo aporte" );
}

Future<DocumentSnapshot?> searchDocumentByTitle(String title) async {
  QuerySnapshot querySnapshot = await db
      .collection("Data")
      .where('TITLE', isEqualTo: title)
      .limit(1)
      .get();
  return querySnapshot.docs.first;
}

Future<void> deleteElement(String title) async{
  QuerySnapshot querySnapshot = await db
      .collection("Data")
      .where('TITLE', isEqualTo: title)
      .get();
  if (querySnapshot.docs.isNotEmpty) {
    String documentId = querySnapshot.docs.first.id;
    await db.collection("Data").doc(documentId).delete();
  } else {
    return;
  }
}

//push token to colection "Username"
Future<void> addUsername(String? token) async{
    QuerySnapshot querySnapshot = await db
      .collection("Username")
      .where('TOKEN', isEqualTo: token)
      .get();
  if(querySnapshot.docs.isNotEmpty){
    return;
  }else{
     await db.collection("Username").add({
    "TOKEN": token
  });
  }
} 

Future<List<String>> obtenerTodosLosTokens() async {

  List<String> tokens = [];

   final querySnapshot = await FirebaseFirestore.instance.collection('Username').get();
   querySnapshot.docs.forEach((doc) {
     tokens.add(doc.data()['TOKEN']);
   });

  return tokens;
}