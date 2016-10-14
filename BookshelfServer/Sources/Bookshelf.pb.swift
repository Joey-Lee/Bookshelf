/*
 * DO NOT EDIT.
 *
 * Generated by the protocol buffer compiler.
 * Source: Bookshelf.proto
 *
 */

import Foundation
import SwiftProtobuf


public struct Book: ProtobufGeneratedMessage {
  public var swiftClassName: String {return "Book"}
  public var protoMessageName: String {return "Book"}
  public var protoPackageName: String {return ""}
  public var jsonFieldNames: [String: Int] {return [
    "id": 1,
    "title": 2,
    "author": 3,
    "numberOfPages": 4,
  ]}
  public var protoFieldNames: [String: Int] {return [
    "id": 1,
    "title": 2,
    "author": 3,
    "numberOfPages": 4,
  ]}

  public var id: Int64 = 0

  public var title: String = ""

  public var author: String = ""

  public var numberOfPages: Int32 = 0

  public init() {}

  public init(id: Int64? = nil,
    title: String? = nil,
    author: String? = nil,
    numberOfPages: Int32? = nil)
  {
    if let v = id {
      self.id = v
    }
    if let v = title {
      self.title = v
    }
    if let v = author {
      self.author = v
    }
    if let v = numberOfPages {
      self.numberOfPages = v
    }
  }

  public mutating func _protoc_generated_decodeField(setter: inout ProtobufFieldDecoder, protoFieldNumber: Int) throws -> Bool {
    let handled: Bool
    switch protoFieldNumber {
    case 1: handled = try setter.decodeSingularField(fieldType: ProtobufInt64.self, value: &id)
    case 2: handled = try setter.decodeSingularField(fieldType: ProtobufString.self, value: &title)
    case 3: handled = try setter.decodeSingularField(fieldType: ProtobufString.self, value: &author)
    case 4: handled = try setter.decodeSingularField(fieldType: ProtobufInt32.self, value: &numberOfPages)
    default:
      handled = false
    }
    return handled
  }

  public func _protoc_generated_traverse(visitor: inout ProtobufVisitor) throws {
    if id != 0 {
      try visitor.visitSingularField(fieldType: ProtobufInt64.self, value: id, protoFieldNumber: 1, protoFieldName: "id", jsonFieldName: "id", swiftFieldName: "id")
    }
    if title != "" {
      try visitor.visitSingularField(fieldType: ProtobufString.self, value: title, protoFieldNumber: 2, protoFieldName: "title", jsonFieldName: "title", swiftFieldName: "title")
    }
    if author != "" {
      try visitor.visitSingularField(fieldType: ProtobufString.self, value: author, protoFieldNumber: 3, protoFieldName: "author", jsonFieldName: "author", swiftFieldName: "author")
    }
    if numberOfPages != 0 {
      try visitor.visitSingularField(fieldType: ProtobufInt32.self, value: numberOfPages, protoFieldNumber: 4, protoFieldName: "numberOfPages", jsonFieldName: "numberOfPages", swiftFieldName: "numberOfPages")
    }
  }

  public func _protoc_generated_isEqualTo(other: Book) -> Bool {
    if id != other.id {return false}
    if title != other.title {return false}
    if author != other.author {return false}
    if numberOfPages != other.numberOfPages {return false}
    return true
  }
}

public struct Shelf: ProtobufGeneratedMessage {
  public var swiftClassName: String {return "Shelf"}
  public var protoMessageName: String {return "Shelf"}
  public var protoPackageName: String {return ""}
  public var jsonFieldNames: [String: Int] {return [
    "id": 1,
    "name": 2,
    "books": 3,
    "keys": 4,
  ]}
  public var protoFieldNames: [String: Int] {return [
    "id": 1,
    "name": 2,
    "books": 3,
    "keys": 4,
  ]}

  public var id: Int64 = 0

  public var name: String = ""

  public var books: [Book] = []

  public var keys: Dictionary<String,String> = [:]

  public init() {}

  public init(id: Int64? = nil,
    name: String? = nil,
    books: [Book] = [],
    keys: Dictionary<String,String> = [:])
  {
    if let v = id {
      self.id = v
    }
    if let v = name {
      self.name = v
    }
    if !books.isEmpty {
      self.books = books
    }
    if !keys.isEmpty {
      self.keys = keys
    }
  }

  public mutating func _protoc_generated_decodeField(setter: inout ProtobufFieldDecoder, protoFieldNumber: Int) throws -> Bool {
    let handled: Bool
    switch protoFieldNumber {
    case 1: handled = try setter.decodeSingularField(fieldType: ProtobufInt64.self, value: &id)
    case 2: handled = try setter.decodeSingularField(fieldType: ProtobufString.self, value: &name)
    case 3: handled = try setter.decodeRepeatedMessageField(fieldType: Book.self, value: &books)
    case 4: handled = try setter.decodeMapField(fieldType: ProtobufMap<ProtobufString,ProtobufString>.self, value: &keys)
    default:
      handled = false
    }
    return handled
  }

  public func _protoc_generated_traverse(visitor: inout ProtobufVisitor) throws {
    if id != 0 {
      try visitor.visitSingularField(fieldType: ProtobufInt64.self, value: id, protoFieldNumber: 1, protoFieldName: "id", jsonFieldName: "id", swiftFieldName: "id")
    }
    if name != "" {
      try visitor.visitSingularField(fieldType: ProtobufString.self, value: name, protoFieldNumber: 2, protoFieldName: "name", jsonFieldName: "name", swiftFieldName: "name")
    }
    if !books.isEmpty {
      try visitor.visitRepeatedMessageField(value: books, protoFieldNumber: 3, protoFieldName: "books", jsonFieldName: "books", swiftFieldName: "books")
    }
    if !keys.isEmpty {
      try visitor.visitMapField(fieldType: ProtobufMap<ProtobufString,ProtobufString>.self, value: keys, protoFieldNumber: 4, protoFieldName: "keys", jsonFieldName: "keys", swiftFieldName: "keys")
    }
  }

  public func _protoc_generated_isEqualTo(other: Shelf) -> Bool {
    if id != other.id {return false}
    if name != other.name {return false}
    if books != other.books {return false}
    if keys != other.keys {return false}
    return true
  }
}