class FavouriteModel {
  int? bookId;
  FavouriteModel(this.bookId);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bookId'] = bookId;
    return map;
  }
}