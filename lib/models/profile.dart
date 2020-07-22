class Profile{
  String name, location, email, phone, password;

  Profile({this.name, this.location, this.email, this.password, this.phone});

  Profile.fromJson(Map<String, dynamic> json)
      : this(
            name: json['name'],
            location: json['location'],
            email: json['email'],
            phone: json['phone'],
            password: json['password']);
  
  Map<String, dynamic> toJson() =>
      {'name': name, 'location': location, 'email': email, 'phone': phone, 'password': password};

  Profile.copy(Profile from) : this(name: from.name, location: from.location,
    email: from.email, phone: from.phone, password: from.password);
}
