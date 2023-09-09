// ignore_for_file: public_member_api_docs, sort_constructors_first
class MenuHotel {
  String name;
  String comment;
  String svg;
  MenuHotel({
    required this.name,
    required this.comment,
    required this.svg,
  });
}

final menuHotel = [
  MenuHotel(
      comment: 'Самое необходимое',
      name: 'Удобства',
      svg: 'assets/svg/conveniences.svg'),
  MenuHotel(
      comment: 'Самое необходимое',
      name: 'Что включено',
      svg: 'assets/svg/included.svg'),
  MenuHotel(
      comment: 'Самое необходимое',
      name: 'Что не включено',
      svg: 'assets/svg/noincluded.svg'),
];
