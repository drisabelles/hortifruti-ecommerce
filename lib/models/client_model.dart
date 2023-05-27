class Client {
  String? id;
  String? name;
  String? surname;
  String? cpf;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? address;
  String? number;
  String? neighborhood;
  String? addressComplement;
  String? uf;
  String? zipCode;

  Client(
      {this.id,
      this.name,
      this.surname,
      this.cpf,
      this.email,
      this.phone,
      this.username,
      this.password,
      this.address,
      this.number,
      this.neighborhood,
      this.addressComplement,
      this.uf,
      this.zipCode});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    cpf = json['cpf'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    password = json['password'];
    address = json['address'];
    number = json['number'];
    neighborhood = json['neighborhood'];
    addressComplement = json['address_complement'];
    uf = json['uf'];
    zipCode = json['zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['cpf'] = this.cpf;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['username'] = this.username;
    data['password'] = this.password;
    data['address'] = this.address;
    data['number'] = this.number;
    data['neighborhood'] = this.neighborhood;
    data['address_complement'] = this.addressComplement;
    data['uf'] = this.uf;
    data['zip_code'] = this.zipCode;
    return data;
  }
}