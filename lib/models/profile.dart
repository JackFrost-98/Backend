class Profile{
  String name, location, email, phone, password, id;

  Profile({this.name, this.location, this.email, this.password, this.phone, this.id});

  Profile.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            name: json['name'],
            location: json['location'],
            email: json['email'],
            phone: json['phone'],
            password: json['password']);
  
  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'location': location, 'email': email, 'phone': phone, 'password': password};

  Profile.copy(Profile from) : this(id:from.id, name: from.name, location: from.location,
    email: from.email, phone: from.phone, password: from.password);
}
