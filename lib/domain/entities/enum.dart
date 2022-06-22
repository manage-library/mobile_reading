enum ERole { user, admin }

extension ERoleExtension on ERole {
  int? get roleNumber {
    switch (this) {
      case ERole.user:
        return 1;
      case ERole.admin:
        return 2;
    }
  }
  static ERole getType (String? value) {
    return ERole.values.firstWhere((element) => element.roleNumber == value);
  }
}

enum EVip { vip_0, vip_1, vip_2, vip_3 }

extension EVipExtension on EVip {
  int? get vipNumber {
    switch (this) {
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

  static EVip getType(String? value) {
    return EVip.values.firstWhere((element) => element.vipNumber == value);
  }
}

enum vipAmount { bronzen, silver, gold }

extension EVipAmountExtension on vipAmount {
  double? get EVipMoney {
    switch (this) {
      case vipAmount.bronzen:
        return 99000;
      case vipAmount.silver:
        return 199000;
      case vipAmount.gold:
        return 399000;
    }
  }
}

enum EReleaseStatus { releasing, released }

extension EReleaseStatusExtension on EReleaseStatus {
  int? get releaseStatusNumber {
    switch (this) {
      case EReleaseStatus.releasing:
        return 1;
      case EReleaseStatus.released:
        return 2;
    }
  }

  static EReleaseStatus getType(String? value) {
    return EReleaseStatus.values.firstWhere((element) => element.releaseStatusNumber == value);
  }
}

enum ECensorshipStatus { pending, approved, rejected }

extension ECensorshipStatusExtension on ECensorshipStatus {
  int? get eCensorshipStatus {
    switch (this) {
      case ECensorshipStatus.pending:
        return 1;
      case ECensorshipStatus.approved:
        return 2;
      case ECensorshipStatus.rejected:
        return 3;
    }
  }
}

enum EGender { male, female, other, unknown }

extension EGenderExtension on EGender {
  int? get genderNumber {
    switch (this) {
      case EGender.male:
        return 1;
      case EGender.female:
        return 2;
      case EGender.other:
        return 3;
    }
  }
}

enum ESortType { asc, desc }

extension ESortTypeExtension on ESortType {
  String? get eSortType {
    switch (this) {
      case ESortType.asc:
        return 'ASC';
      case ESortType.desc:
        return 'DESC';
    }
  }

  static ESortType getType(String? value) {
    return ESortType.values.firstWhere((element) => element.eSortType == value);
  }
}

enum ESortBy { like, view, update_time }

extension ESortByteExtension on ESortBy {
  int? get eSortByteNumber {
    switch (this) {
      case ESortBy.like:
        return 1;
      case ESortBy.view:
        return 2;
      case ESortBy.update_time:
        return 3;
    }
  }

  static ESortBy getType(String? value) {
    return ESortBy.values.firstWhere((element) => element.eSortByteNumber == value);
  }
}
