// ignore_for_file: prefer_collection_literals

class Note {
  String? judul;
  String? isi;

  Note({this.judul, this.isi});

  Note.fromJson(Map<String, dynamic> json) {
    judul = json['judul'];
    isi = json['isi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['judul'] = judul;
    data['isi'] = isi;
    return data;
  }
}
