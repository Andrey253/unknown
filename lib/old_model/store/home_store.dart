import 'package:equatable/equatable.dart';

class HomeStore extends Equatable{
    const HomeStore({
        required this.id,
         this.isNew,
        required this.title,
        required this.subtitle,
        required this.picture,
        required this.isBuy,
    });

    final int id;
    final bool? isNew;
    final String title;
    final String subtitle;
    final String picture;
    final bool isBuy;

    factory HomeStore.fromJson(Map<String, dynamic> json) => HomeStore(
        id: json["id"],
        isNew: json["is_new"],
        title: json["title"],
        subtitle: json["subtitle"],
        picture: json["picture"],
        isBuy: json["is_buy"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "is_new": isNew,
        "title": title,
        "subtitle": subtitle,
        "picture": picture,
        "is_buy": isBuy,
    };

  @override
  bool operator ==(covariant HomeStore other) {

  
    return 
      other.id == id &&
      other.picture == picture ;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      isNew.hashCode ^
      title.hashCode ^
      subtitle.hashCode ^
      picture.hashCode ^
      isBuy.hashCode;
  }
  
  @override
  List<Object?> get props =>[id,isBuy,isNew,title,subtitle, picture];
}
