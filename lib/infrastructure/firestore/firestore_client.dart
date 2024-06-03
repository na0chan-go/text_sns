import 'package:text_sns/typedefs/firestore_typedef.dart';

class FirestoreClient {
  Future<void> createDoc(DocRef ref, SDMap json) async => await ref.set(json);
  FutureDoc getDoc(DocRef ref) async => await ref.get();
}
