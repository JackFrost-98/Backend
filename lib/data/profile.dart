class Profile{
  String name, location, email, phone, password;

  Profile({this.name, this.location, this.email, this.password, this.phone});
  Profile.copy(Profile from) : this(name: from.name, location: from.location,
    email: from.email, phone: from.phone, password: from.password);
}
