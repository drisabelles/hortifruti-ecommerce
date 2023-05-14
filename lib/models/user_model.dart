import 'package:flutter/material.dart';

@immutable
class UserModel {
  //personal data
  final String name;
  final String surname;
  final String cpf;
  final String email;
  final String phone;
  final String username;
  final String password;
  //residential data
  final String address;
  final String number;
  final String address_complement;
  final String uf;
  final String zip_code;

  UserModel({
    //personal data
    this.name = '',
    this.surname = '',
    this.cpf = '',
    this.email = '',
    this.phone = '',
    this.username = '',
    this.password = '',
    //residential data
    this.address = '',
    this.number = '',
    this.address_complement = '',
    this.uf = '',
    this.zip_code = ''
  });

  UserModel copyWith({
    //personal data
    String? name,
    String? surname,
    String? cpf,
    String? email,
    String? phone,
    String? username,
    String? password,
    //residential data
    String? address,
    String? number,
    String? address_complement,
    String? uf,
    String? zip_code,
  }) 

  {
    return UserModel(
      //personal data
      name: name ?? this.name,
      surname: surname ?? this.surname,
      cpf: cpf ?? this.cpf,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      username: username ?? this.username,
      password: password ?? this.password,
      //residential data
      address: address ?? this.address,
      number: number ?? this.number,
      address_complement: address_complement ?? this.address_complement,
      uf: uf ?? this.uf,
      zip_code: zip_code ?? this.zip_code,
    );
  }
}
