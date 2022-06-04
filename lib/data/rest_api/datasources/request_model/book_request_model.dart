class BookRequestModel {
  final String? bookName;
  final String? authorName;
  final int? categoryId;
  final bool? isVip;
  final int? releaseStatus;
  final int? sortBy;
  final String? sortType;

  BookRequestModel(
      {this.bookName, this.authorName, this.categoryId, this.isVip, this.releaseStatus, this.sortBy, this.sortType});


}

enum ERole {user, admin}
extension ERoleExtension on ERole{
  int? get roleNumber {
    switch(this) {
      case ERole.user:
        return 1;
      case ERole.admin:
        return 2;
    }
  }

}
enum EVip {vip_0, vip_1, vip_2, vip_3}
extension EVipExtension on EVip {
  int? get vipNumber {
    switch(this) {
      case EVip.vip_0:
        return 0;
      case EVip.vip_1:
        return 1;
      case EVip.vip_2:
       return 3;
      case EVip.vip_3:
       return 6;
    }
  }
}
enum vipAmount {bronzen, silver, gold}
extension EVipAmountExtension on vipAmount {
  double? get EVipMoney {
    switch(this) {
      case vipAmount.bronzen:
        return 99000;
      case vipAmount.silver:
        return 199000;
      case vipAmount.gold:
        return 399000;
    }
  }
}
enum EReleaseStatus {releasing, released}
extension EReleaseStatusExtension on EReleaseStatus {
  int? get releaseStatusNumber {
    switch(this) {
      case EReleaseStatus.releasing:
        return 1;
      case EReleaseStatus.released:
        return 2;
    }
  }
}
enum ECensorshipStatus {pending, approved, rejected}
extension ECensorshipStatusExtension on ECensorshipStatus {
  int? get eCensorshipStatus {
    switch(this) {
      case ECensorshipStatus.pending:
        return 1;
      case ECensorshipStatus.approved:
        return 2;
      case ECensorshipStatus.rejected:
        return 3;
    }
  }
}
enum EGender {male, female, other}
extension EGenderExtension on EGender {
  int? get genderNumber {
    switch(this) {
      case EGender.male:
        return 1;
      case EGender.female:
        return 2;
      case EGender.other:
        return 3;
    }
  }
}
enum ESortType {asc, desc}
extension ESortTypeExtension on ESortType {
  String? get eSortType {
    switch(this) {
      case ESortType.asc:
        return 'ASC';
      case ESortType.desc:
        return 'DESC';
    }
  }
}
enum ESortByte {like, view, update_time}
extension ESortByteExtension on ESortByte {
  int? get eSortByteNumber {
    switch(this) {
      case ESortByte.like:
        return 1;
      case ESortByte.view:
        return 2;
      case ESortByte.update_time:
        return 3;
    }
  }
}

