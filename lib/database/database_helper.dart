import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class InStocks {
  final int? id;
  final String? productName;
  final String? authorName;
  final String? edition;
  final String? amount;
  final String? unitPrice;
  final String? total;
  final String? dateCreated;
  final String? addInfo;

  InStocks({this.id, this.productName, this.authorName, this.edition, this.amount, this.unitPrice, this.total, this.dateCreated, this.addInfo});

  factory InStocks.fromMap(Map<String, dynamic> json) => InStocks(
    id: json['id'],
    productName: json['productName'],
    authorName: json['authorName'],
    edition: json['edition'],
    amount: json['amount'],
    unitPrice: json['unitPrice'],
    total: json['total'],
    dateCreated: json['dateCreated'],
    addInfo: json['addInfo']
  );

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'productName' : productName,
      'authorName' : authorName,
      'edition' : edition,
      'amount' : amount,
      'unitPrice' : unitPrice,
      'total' : total,
      'dateCreated' : dateCreated,
      'addInfo' : addInfo
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database; // If this variable does not exist
  Future<Database> get database async => _database ??= await _initDatabase(); // then initialise the DB

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'instock.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

//  Create the database if it doesn't exist
  Future _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE instocks(
        id INTEGER PRIMARY KEY,
        productName TEXT,
        authorName TEXT,
        edition TEXT,
        amount TEXT,
        unitPrice TEXT,
        total TEXT,
        dateCreated TEXT, 
        addInfo TEXT
      );
      '''
    );
  }

  Future<List<InStocks>> getInStocks() async {
    Database db = await instance.database;
    var instocks = await db.query('instocks', orderBy: 'productName');
    List<InStocks> inStockList = instocks.isNotEmpty ? instocks.map((e) => InStocks.fromMap(e)).toList() : [];
    return inStockList;
  }

  Future<int> add(InStocks instocks) async{
    Database db = await instance.database;
    return await db.insert('instocks', instocks.toMap());
  }
}