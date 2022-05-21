class Doctor{
  late String nameofthedoctor;
  late String categorie;
  late String place;
  late int rating;
  late String image;
  Doctor(this.nameofthedoctor , this.categorie , this.place , this.rating , this.image);
  static List<Doctor> blog(){
    return [
      Doctor('Dr.Ferhati Khalil', 'Pshycologue', 'Sidi Belabbes', 4 , 'assets/images/doc7.png'),
      Doctor('Dr.Zerrougui Amjed', 'Radiologues', 'Sidi Belabbes', 4 , 'assets/images/doc3.png' ),
      Doctor('Dr.Sakhroui Chiheb', 'Pshyciatres', 'Sidi Belabbes', 4 , 'assets/images/doc6.png'),
      Doctor('Dr.Bouzaboudja Bahaa', 'Cardiologues', 'Sidi Belabbes', 4 , 'assets/images/doc6.png'),
      Doctor('Dr.Fellah Nassim', 'Pédiatres', 'Sidi Belabbes', 4 , 'assets/images/doc5.png'),
      Doctor('Dr.Titouah Yaccine', 'Pshycologue', 'Sidi Belabbes', 4 , 'assets/images/doc7.png'),
    ];
  }
  static List<Doctor> blog2(){
    return [
      Doctor('Dr.Ahmed Zakaria', 'Radiologues', 'Batna', 3, 'assets/images/doc8.png' ),
      Doctor('Dr.Mustapha Zahdour', 'Pédiatres', 'Alger', 1, 'assets/images/doc9.png'),
      Doctor('Dr.Mohammed Hassan', 'Pshycologue', 'Setif', 2, 'assets/images/doc11.png'),
      Doctor('Dr.Hassan Al-Fullaih', 'Pshycologue', 'Jijel', 3, 'assets/images/doc11.png'),
      Doctor('Dr.Ahmed Hamid', 'Pshycologue', 'Bejaia', 3, 'assets/images/doc9.png')
    ];
  }

}