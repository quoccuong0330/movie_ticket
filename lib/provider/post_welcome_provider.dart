import 'package:flutter/material.dart';
import 'package:movie_ticket/data/mock_data.dart';
import 'package:movie_ticket/domain/model/post_welcome.dart';

class PostWelcomeProvider extends ChangeNotifier {
  Future<List<PostWelcome>> getPostWelcome() async {
    try {
      return MockData().postWelcomes;
    } catch (e) {
      rethrow;
    }
  }
}
