// enum Period { DAYS, MONTHS, YEARS, }
class Stretch {
  String name;
  String link;
  String instructions;
  int id;


  Stretch(this.name, this.instructions, this.link, this.id);

  String getName() {
    return name;
  }
  String getLink() {
    return link;
  }
  String getInstructions() {
    return instructions;
  }

  int getID() {
    return id;
  }

  void setName(String name) {
    this.name = name;
  }
  void setLink(String link) {
    this.link = link;
  }
  void setInstructions(String instructions) {
    this.instructions = instructions;
  }
  void setID(int id) {
    this.id = id;
  }

  factory Stretch.fromJson(dynamic json) {
    return Stretch(json['name'] as String, json['instructions'] as String,
        json['link'] as String, json['id'] as int);
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'instructions': instructions,
    'link': link,
    'id':id
  };

  @override
  bool operator == (Object other) {
    return other is Stretch &&
        other.name == name &&
        other.link == link &&
        other.instructions == instructions &&
        other.id == id;
  }

  @override
  String toString(){
    return toJson().toString();
  }

  Stretch clone(){
    return Stretch(name, instructions, link, id);
  }

}