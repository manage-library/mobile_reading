
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:book_reading_mobile_app/data/rest_api/repositories_impl/detail_repository_impl.dart';
import 'package:book_reading_mobile_app/favourite_logic/stream_subcrptions_mixins.dart';
import 'package:get/get.dart';

import '../domain/entities/book.dart';
import '../favourite_logic/set_favourite_model.dart';

abstract class BaseController extends GetxController implements StreamSubscriptionsMixin {
  final DetailBookImpl _detailBookImpl = DetailBookImpl();
  PublishSubject<FavouriteModel> setFavouriteSubject = PublishSubject();
  PublishSubject<bool> reloadListViewState = PublishSubject();
  VoidCallback? onSuccess;
  var currentBook = Book().obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    

    setFavouriteSubject
        .flatMap((value) => _detailBookImpl.setFavourite(value, currentBook.value.id ?? 1))
        .listen((event) {
      reloadListViewState.add(true);

      if (onSuccess != null) {
        onSuccess!();
      }
    }).addTo(bag);
  }

  @override
  onClose() {
    bag.dispose();
    super.onClose();
  }

  void updateFavouriteForItem({required int bookId, VoidCallback? onSuccess}) {
    this.onSuccess = onSuccess;

    var request = FavouriteModel(bookId);
    setFavouriteSubject.add(request);
  }
}
