import 'package:birthday_app/data/models/wish_list/wish_list_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RemoteDataSource {
  static Future<void> addWish(WishModel wishListModel) async {
    try {
      final firestoreInstance = FirebaseFirestore.instance;

      CollectionReference collectionRef =
          firestoreInstance.collection('wishlist');

      await collectionRef.add(wishListModel.toJson());
    } catch (e) {
      print('Ошибка при добавлении данных в Firestore: $e');
    }
  }

  static Future<void> updateWish(WishModel newWish) async {
    try {
      final firestoreInstance = FirebaseFirestore.instance;

      CollectionReference collectionRef =
          firestoreInstance.collection('wishlist');
      DocumentReference docRef = collectionRef.doc(newWish.id);

      await docRef.update(newWish.toJson());

      print('Данные успешно обновлены в Firestore.');
    } catch (e) {
      print('Ошибка при обновлении данных в Firestore: $e');
    }
  }

  static Future<List<WishModel>> getData() async {
    try {
      final firestoreInstance = FirebaseFirestore.instance;

      CollectionReference collectionRef =
          firestoreInstance.collection('wishlist');

      QuerySnapshot querySnapshot = await collectionRef.get();

      List<WishModel> wishListItems = [];

      querySnapshot.docs.forEach((docSnapshot) {
        String docId = docSnapshot.id;
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        WishModel item = WishModel(
          id: docId,
          title: data['title'],
          url: data['url'],
          isPicked: data['isPicked'],
        );

        wishListItems.add(item);
      });
      return wishListItems;
    } catch (e) {
      print('Ошибка при получении данных из Firestore: $e');
      return [];
    }
  }


  static Future<void> deleteData(String docId) async {
    try {
      final firestoreInstance = FirebaseFirestore.instance;

      
      CollectionReference collectionRef = firestoreInstance.collection('wishlist');
      DocumentReference docRef = collectionRef.doc(docId);

      await docRef.delete();

      print('Документ успешно удален из Firestore.');
    } catch (e) {
      print('Ошибка при удалении данных из Firestore: $e');
    }
  }

  }
