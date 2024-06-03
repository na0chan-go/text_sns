import 'package:text_sns/infrastructure/firestore/firestore_client.dart';
import 'package:text_sns/models/result/result.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';
import 'package:text_sns/typedefs/result_typedef.dart';

class FirestoreRepository {
  FutureResult<bool> createDoc(DocRef ref, SDMap json) async {
    final client = FirestoreClient(); // create an instance of FirestoreClient
    try {
      await client.createDoc(ref, json); // create a document in Firestore
      return const Result.success(true); // return a successful result
    } catch (e) {
      return const Result.failure(); // return a failed result
    }
  }

  FutureResult<Doc> getDoc(DocRef ref) async {
    final client = FirestoreClient(); // create an instance of FirestoreClient
    try {
      final Doc doc = await client.getDoc(ref); // get a document from Firestore
      return Result.success(doc); // return a successful result
    } catch (e) {
      return const Result.failure(); // return a failed result
    }
  }
}
