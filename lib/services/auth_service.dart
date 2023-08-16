import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io' as io;

import '../models/usuario.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  adicionarModel(Usuario usuario) async {
    await _db.collection('usuarios').add(usuario.toJson());
  }

  registrar(String email, String senha, String nome, Usuario user) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      adicionarModel(user);
      _getUser();
      usuario?.updateDisplayName(nome);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é muito fraca!');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este email já está cadastrado');
      }
    }
  }

  registrar2(Usuario usuario) async {
    try {
      await _db.collection('usuários').add(usuario.toJson());
      _getUser();
    } on FirebaseException catch (e) {
      Exception(e.message);
    }
  }

  login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('EMAIL NAO ENCONTRADO');
        throw AuthException('Email não encontrado. Cadastre-se.');
      } else if (e.code == 'wrong-password') {
        print('SENHA INCORRETA');
        throw AuthException('Senha incorreta. Tente novamente');
      }
    }
  }

// final bytes = io.File(imageBytes.path).readAsBytesSync();

// String img64 = base64Encode(bytes);

  updateFoto(String url) async {
    try {
      final bytes = io.File(url).readAsBytesSync();
      String img64 = base64Encode(bytes);
      print("IMAGEMMMMMMMMMMM: " + img64);
      await usuario?.updatePhotoURL('data:image/jpeg;base64,' + img64);
      _getUser();
      print(usuario?.photoURL);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  adicionarCep(int cep) async {}

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}
